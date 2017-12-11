class Previous < FPM::Cookery::Recipe
  name        'previous'
  description 'Previous is a Next computer hardware emulator. It aims to emulate a Next Cube or a Next Station with all its peripheral.'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'
  license     'GPL-2.0'

  svn_revision = '845'

  version  "1.8+svn#{svn_revision}"
  revision '1'

  homepage 'http://previous.alternative-system.com/'
  source   'https://svn.code.sf.net/p/previous/code/trunk',
    :with     => 'svn',
    :revision => "r#{svn_revision}"

  build_depends 'g++', 'cmake', 'zlib1g-dev', 'libpng12-dev', 'libsdl2-dev', 'subversion'
  depends       'libsdl2-2.0-0'

  def build
    configure :prefix => '/usr'
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
