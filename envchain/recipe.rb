class Envchain < FPM::Cookery::Recipe
  name 'envchain'
  version '1.0.1'
  revision '1'

  homepage "https://github.com/sorah/#{name}"
  source "https://github.com/sorah/#{name}.git",
    :with => 'git',
    :tag => "v#{version}"

  description 'Environment variables meet gnome-keyring'

  license 'MIT License'
  build_depends 'libsecret-1-dev', 'libreadline-dev'

  def build
    # Crappy workaround for installing build_depends because fpm-cookery uses
    # puppet 3.x, Ubuntu Xenial uses ruby 2.3 and they aren't compatible
    case FPM::Cookery::Facts.osmajorrelease
    when "16.04"
      FPM::Cookery::Log.info "Installing build_depends: #{build_depends.join(' ')}"
      sh("apt-get install -qq -y #{build_depends.join(' ')}")
    end
    make
  end

  def install
    bin.install 'envchain'
    share('doc/envchain').install %w(README.md LICENSE)

  end
end
