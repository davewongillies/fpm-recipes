class Swift < FPM::Cookery::Recipe
  name     'swift'
  version  '4.1.3'
  revision '1'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'GPL-2.0'

  osrel = FPM::Cookery::Facts.osrelease.sub('.', '')

  homepage "https://swift.org"
  source   "#{homepage}/builds/#{name}-#{version}-release/#{FPM::Cookery::Facts.platform}#{osrel}/#{name}-#{version}-RELEASE/#{name}-#{version}-RELEASE-#{FPM::Cookery::Facts.platform}#{FPM::Cookery::Facts.osrelease}.tar.gz"

  description 'A fast and easy-to-use status bar'

  def build; end

  def install
    destdir("/").install Dir["*"]
  end

end
