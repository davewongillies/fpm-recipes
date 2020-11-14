class LibinputGestures < FPM::Cookery::Recipe
  name 'libinput-gestures'
  version '2.52'
  revision '3'

  homepage "https://github.com/bulletmark/#{name}"
  source "https://github.com/bulletmark/#{name}.git",
    :with => 'git',
    :tag  => version

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'

  description 'Actions gestures on your touchpad using libinput'
  license 'MIT'

  depends \
    'dbus-action',
    'libinput-tools',
    'python3',
    'wmctrl',
    'xdotool'

  def build; end

  def install
    bin.install "#{name}-setup"
    bin.install name
    etc.install "#{name}.conf"
    doc(name).install 'README.md'
    share('applications').install "#{name}.desktop"
    share('icons/hicolor/128x128/apps').install "#{name}.svg"
  end

end
