class Polybar < FPM::Cookery::Recipe
  name 'polybar'
  version '3.0.5'
  revision '1'

  homepage "https://github.com/jaagr/#{name}"
  source "https://github.com/jaagr/#{name}.git",
    :with      => 'git',
    :tag       => version,
    :submodule => true

  description 'A fast and easy-to-use status bar'
  build_depends 'cmake',
    'cmake-data',
    'libboost-dev',
    'i3-wm',
    'libasound2-dev',
    'libcairo2-dev',
    'libcurl4-openssl-dev',
    'libfontconfig1-dev',
    'libfreetype6-dev',
    'libghc-x11-xft-dev',
    'libiw-dev',
    'libiw-dev',
    'libjsoncpp-dev',
    'libmpdclient-dev',
    'libx11-xcb-dev',
    'libxcb-ewmh-dev',
    'libxcb-icccm4-dev',
    'libxcb-image0-dev',
    'libxcb-randr0-dev',
    'libxcb-util0-dev',
    'libxcb-xkb-dev',
    'libxcb1-dev',
    'pkg-config',
    'python-xcbgen',
    'xcb-proto'
  depends 'libmpdclient2', 'libxcb-ewmh2'

  def build
    safesystem 'cmake -DCMAKE_BUILD_TYPE=Release'
    make
  end

  def install
   make :install, 'DESTDIR' => destdir
  end

end
