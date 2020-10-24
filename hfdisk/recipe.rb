class Hfdisk < FPM::Cookery::Recipe
  name     'hfdisk'
  version  '0.1'
  revision '23'

  description 'Port of the Apple mklinux mac-fdisk pdisk utility to x86.'
  license     'MIT'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'

  homepage 'http://www.codesrc.com/gitweb/index.cgi?p=hfdisk.git;a=summary'
  source   "git://www.codesrc.com/git/#{name}",
    :with      => 'git',
    :ref       => 'a7659ed434abc8fb6994498e9e0e6e2c40bfbf51'

  def build
    make
  end

  def install
    sbin.install name
  end
end
