class Zeal < FPM::Cookery::Recipe
  name        'zeal'
  description 'Offline documentation browser inspired by Dash'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'
  license     'GPL-3.0'

  EPOCH = "2:"
  version  "#{EPOCH}0.6.1"
  revision '3'

  homepage 'https://zealdocs.org'
  source   'https://github.com/zealdocs/zeal.git',
    :with => 'git',
    :ref  => '30c85bb13679036e8e81b050d01be13d383cf0fe'

  build_depends 'cmake', 'extra-cmake-modules','libqt5webkit5-dev', 'libqt5x11extras5-dev', 'libarchive-dev', 'libsqlite3-dev','libxcb-keysyms1-dev'
  depends       'libqt5webkit5', 'libqt5x11extras5', 'libarchive13', 'libsqlite3-0', 'libxcb-keysyms1', 'libqt5concurrent5'

  def build
    safesystem 'cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr'
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
    doc(name).install Dir['README.md', 'COPYING']
  end
end
