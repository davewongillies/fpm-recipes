class Terminator < FPM::Cookery::Recipe
  name       'terminator'
  version    '2.1.1'
  # git_ref =  '9e05a5d'
  # revision   "1~g#{git_ref}"
  revision   "1"
  homepage   'https://github.com/gnome-terminator/terminator'
  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'GPL-2.0'
  source     "https://github.com/gnome-terminator/#{name}.git",
    :with => 'git',
    :tag  => "v#{version}"
    # :sha  => git_ref

  description 'multiple GNOME terminals in one window'

  build_depends 'gettext',
                'intltool',
                'python3-babel',
                'python3-setuptools'

  depends 'dbus-x11',
          'gir1.2-glib-2.0',
          'gir1.2-gtk-3.0',
          'gir1.2-keybinder-3.0',
          'gir1.2-pango-1.0',
          'gir1.2-vte-2.91',
          'python3',
          'python3-cairo',
          'python3-configobj',
          'python3-dbus',
          'python3-gi',
          'python3-gi-cairo',
          'python3-psutil'

  def build
    safesystem 'python3 setup.py build'
  end

  def install
    safesystem 'python3 setup.py install '\
      '--install-layout deb '\
      '--prefix /usr '\
      "--root #{destdir}"
  end
end
