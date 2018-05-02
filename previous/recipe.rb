class Previous < FPM::Cookery::Recipe
  name        'previous'
  description 'Previous is a Next computer hardware emulator. It aims to emulate a Next Cube or a Next Station with all its peripheral.'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'
  license     'GPL-2.0'

  svn_revision = '885'

  version  "2.0+svn#{svn_revision}"
  revision '1'

  homepage 'http://previous.alternative-system.com/'
  source   'https://svn.code.sf.net/p/previous/code/trunk',
    :with     => 'svn',
    :revision => "r#{svn_revision}"

  build_depends 'g++', 'cmake', 'zlib1g-dev', 'libpng12-dev', 'libsdl2-dev', 'subversion', 'libudev-dev', 'libgl1-mesa-dev', 'libglu1-mesa-dev', 'libasound2-dev', 'libpulse-dev', 'libopenal-dev', 'libaudiofile-dev', 'libdbus-1-dev', 'libdirectfb-dev', 'libpcap-dev'
  depends       'libsdl2-2.0-0', 'libudev1', 'libglu1-mesa', 'libasound2', 'libpulse0', 'libopenal1', 'libaudiofile1', 'libdbus-1-3', 'libdirectfb-1.2-9', 'libpcap0.8'

  def build
    configure :prefix => '/usr'
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
