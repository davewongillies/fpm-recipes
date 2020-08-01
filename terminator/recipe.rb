class Terminator < FPM::Cookery::Recipe
  name       'terminator'
  version    '1.92'
  git_ref =  '9e05a5d'
  revision   "1~g#{git_ref}"
  homepage   'https://github.com/gnome-terminator/terminator'
  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'GPL-2.0'
  source     "https://github.com/gnome-terminator/#{name}.git",
    :with => 'git',
    :sha  => git_ref
    # :tag  => "v#{version}"

  description 'multiple GNOME terminals in one window'

  build_depends 'python3-setuptools'
  depends       'python3',
                'python3-gi',
                'python3-gi-cairo',
                'python3-psutil',
                'gir1.2-keybinder-3.0',
                'gir1.2-vte-2.91',
                'gettext',
                'intltool',
                'dbus-x11'

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
