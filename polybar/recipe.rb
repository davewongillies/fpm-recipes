class Polybar < FPM::Cookery::Recipe
  name 'polybar'
  version '3.4.3'
  revision '1'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'MIT'

  homepage "https://github.com/polybar/#{name}"
  source "https://github.com/polybar/#{name}.git",
    :with      => 'git',
    :submodule => true,
    :tag       => version

  description 'A fast and easy-to-use status bar'

  case FPM::Cookery::Facts.lsbcodename
    when :focal
      build_deps = ['python3-xcbgen']
    else
      build_deps = ['python-xcbgen']
  end

  build_depends 'cmake',
    'cmake-data',
    'i3-wm',
    'libasound2-dev',
    'libboost-dev',
    'libcairo2-dev',
    'libcurl4-openssl-dev',
    'libcurlpp-dev',
    'libfontconfig1-dev',
    'libfreetype6-dev',
    'libghc-x11-xft-dev',
    'libiw-dev',
    'libjsoncpp-dev',
    'libmpdclient-dev',
    'libnl-genl-3-dev',
    'libpulse-dev',
    'libx11-xcb-dev',
    'libxcb-composite0-dev',
    'libxcb-ewmh-dev',
    'libxcb-icccm4-dev',
    'libxcb-image0-dev',
    'libxcb-randr0-dev',
    'libxcb-util0-dev',
    'libxcb-xkb-dev',
    'libxcb1-dev',
    'pkg-config',
    'xcb-proto',
    build_deps

  depends 'libmpdclient2', 'libxcb-ewmh2'

  def build
    safesystem 'cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr'
    make
  end

  def install
   make :install, 'DESTDIR' => destdir
  end

end
