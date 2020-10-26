class Previous < FPM::Cookery::Recipe
  name        'previous'
  description 'Previous is a Next computer hardware emulator. It aims to emulate a Next Cube or a Next Station with all its peripheral.'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'
  license     'GPL-2.0'

  svn_revision = '950'

  version  "2.2+svn#{svn_revision}"
  revision '2'

  homepage 'http://previous.alternative-system.com/'
  source   'https://svn.code.sf.net/p/previous/code/trunk',
    :with     => 'svn',
    :revision => "r#{svn_revision}"

  build_depends \
    'cmake',
    'g++',
    'libasound2-dev',
    'libaudiofile-dev',
    'libdbus-1-dev',
    'libdirectfb-dev',
    'libgl1-mesa-dev',
    'libglu1-mesa-dev',
    'libopenal-dev',
    'libpcap-dev',
    'libpng-dev',
    'libpulse-dev',
    'libsdl2-dev',
    'libudev-dev',
    'subversion',
    'zlib1g-dev'

  depends \
    'libasound2',
    'libaudiofile1',
    'libdbus-1-3',
    'libdirectfb-1.7-7',
    'libglu1-mesa',
    'libopenal1',
    'libpcap0.8',
    'libpulse0',
    'libsdl2-2.0-0',
    'libudev1'

  def build
    configure :prefix => '/usr'
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
    share('applications').install workdir("#{name}.desktop")
  end
end
