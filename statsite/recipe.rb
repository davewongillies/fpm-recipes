class Statsite < FPM::Cookery::Recipe
  name     'statsite'
  version  '0.8.0'
  revision '1'

  description 'C implementation of statsd'

  homepage "https://github.com/statsite/#{name}"
  source   "https://github.com/statsite/#{name}.git",
    :with      => 'git',
    :ref       => 'master'

  build_depends 'autoconf', 'automake', 'dh-autoreconf', 'libtool', 'pkg-config'

  def build
    # Crappy workaround for installing build_depends because fpm-cookery uses
    # puppet 3.x, Ubuntu Xenial uses ruby 2.3 and they aren't compatible
    case FPM::Cookery::Facts.osmajorrelease
    when "16.04"
     FPM::Cookery::Log.info "Installing build_depends: #{build_depends.join(' ')}"
     safesystem "apt-get update ; apt-get install -y #{build_depends.join(' ')}"
    end

    safesystem("./autogen.sh")
    configure
    make
  end

  def install
   make :install, 'DESTDIR' => destdir
  end

end
