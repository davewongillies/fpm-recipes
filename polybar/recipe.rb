class Polybar < FPM::Cookery::Recipe
  name 'polybar'
  version '2.3.5'
  revision '2-6f6c5b74'

  homepage "https://github.com/jaagr/#{name}"
  source "https://github.com/jaagr/#{name}.git",
    :with      => 'git',
    :tag       => '6f6c5b74591e8f9d64f0bd731893b57985a5acd4',
    :submodule => true

  description 'A fast and easy-to-use status bar'
  build_depends 'cmake', 'cmake-data', 'libboost-dev', 'libfreetype6-dev', 'libxcb1-dev', 'libx11-xcb-dev', 'libxcb-util0-dev', 'libxcb-image0-dev', 'libxcb-randr0-dev', 'libxcb-ewmh-dev', 'libxcb-icccm4-dev', 'xcb-proto', 'python-xcbgen', 'i3-wm', 'libiw-dev', 'libasound2-dev', 'libmpdclient-dev', 'pkg-config', 'libfontconfig1-dev', 'libghc-x11-xft-dev'
  depends 'libmpdclient2'

  def build
    # Crappy workaround for installing build_depends because fpm-cookery uses
    # puppet 3.x, Ubuntu Xenial uses ruby 2.3 and they aren't compatible
    case FPM::Cookery::Facts.osmajorrelease
    when "16.04"
     FPM::Cookery::Log.info "Installing build_depends: #{build_depends.join(' ')}"
     safesystem "apt-get update ; apt-get install -y #{build_depends.join(' ')}"
    end

    safesystem 'cmake -DCMAKE_BUILD_TYPE=Release'
    make
  end

  def install
   make :install, 'DESTDIR' => destdir
  end

end
