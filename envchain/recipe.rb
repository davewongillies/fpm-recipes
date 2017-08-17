class Envchain < FPM::Cookery::Recipe
  name 'envchain'
  version '1.0.1'
  revision '2'

  homepage "https://github.com/sorah/#{name}"
  source "https://github.com/sorah/#{name}.git",
    :with => 'git',
    :tag => "v#{version}"

  description 'Environment variables meet gnome-keyring'
  license 'MIT License'
  build_depends 'libsecret-1-dev', 'libreadline-dev'

  def build
    make
  end

  def install
    bin.install 'envchain'
    doc(name).install Dir['README.md', 'LICENSE']
  end
end
