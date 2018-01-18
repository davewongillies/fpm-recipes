class Xst < FPM::Cookery::Recipe
  name     'xst'
  version  '0.7.1'
  revision '1'

  description 'st fork'
  license     'MIT'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'

  homepage "https://github.com/neeasade/#{name}"
  source   "https://github.com/neeasade/#{name}.git",
    :with      => 'git',
    :tag       => "v#{version}"

  build_depends 'pkg-config', 'libx11-dev', 'libxft-dev', 'libxext-dev'

  replaces 'st'

  def build
    make
  end

  def install
   make :install, 'PREFIX' => '/usr', 'DESTDIR' => destdir
  end

end
