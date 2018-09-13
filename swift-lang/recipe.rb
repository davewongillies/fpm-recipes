class Swift < FPM::Cookery::Recipe
  name     'swift-lang'
  version  '4.1.3'
  revision '1'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'Apache-2.0'
  depends    'clang-5.0', 'python'

  osrel = FPM::Cookery::Facts.osrelease.sub('.', '')

  homepage "https://swift.org"
  source   "#{homepage}/builds/swift-#{version}-release/#{FPM::Cookery::Facts.platform}#{osrel}/swift-#{version}-RELEASE/swift-#{version}-RELEASE-#{FPM::Cookery::Facts.platform}#{FPM::Cookery::Facts.osrelease}.tar.gz"

  description 'Swift is a general-purpose programming language built using a modern approach to safety, performance, and software design patterns.'

  def build; end

  def install
    destdir("/").install Dir["*"]
  end

end
