class Gestures < FPM::Cookery::Recipe
  name 'gestures'
  version '0.2.3'
  revision '1'

  homepage "https://gitlab.com/cunidev/#{name}"
  source "https://gitlab.com/cunidev/#{name}.git",
    :with => 'git',
    :tag  => version

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'

  description 'Modern, minimal GUI app for libinput-gestures'
  license 'GPL-3.0'

  build_depends 'python3-setuptools'
  depends \
    'libinput-tools',
    # 'libinput-gestures',
    'python3',
    'python3-gi',
    'python3-setuptools',
    'xdotool'

  def build; end

  def install
    safesystem 'python3 setup.py install '\
      '--install-layout deb '\
      '--prefix /usr '\
      "--root #{destdir}"
  end

end
