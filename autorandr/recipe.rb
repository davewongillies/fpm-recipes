class Autorandr < FPM::Cookery::Recipe
  name 'autorandr'
  version '0.0.33'
  revision '2~4f5e240'

  homepage "https://github.com/wertarbyte/#{name}"
  source "https://github.com/wertarbyte/#{name}.git",
    :with => 'git'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'

  description 'Auto-detect the connect display hardware and load the appropiate X11 setup using xrandr or disper'
  license 'MIT'
  depends 'pm-utils', 'bash-completion'

  def build
  end

  def install
    bin.install 'autorandr'
    etc('pm/config.d').install 'pm-utils/40autorandr'
    etc('bash_completion.d').install 'bash_completion/autorandr'
    doc(name).install 'README'
  end
end
