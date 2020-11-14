class DbusAction < FPM::Cookery::Recipe
  name 'dbus-action'
  version '1.3'
  revision '2'

  homepage "https://github.com/bulletmark/#{name}"
  source "https://github.com/bulletmark/#{name}.git",
    :with => 'git',
    :tag  => version

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'

  description 'Watch D-Bus to action configured commands on specific events'
  license 'MIT'

  depends \
    'python3',
    'python3-gi',
    'python3-dbus',
    'python3-ruamel.yaml'

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
