class Swift < FPM::Cookery::Recipe
  name     'swift-lang'
  version  '4.2'
  revision '2'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'Apache-2.0'

  homepage "https://swift.org"
  description 'Swift is a general-purpose programming language built using a modern approach to safety, performance, and software design patterns.'

  common_deps = 'clang', 'clang-5.0', 'python', 'libxml2'

  case FPM::Cookery::Facts.platform
  when :ubuntu
    case FPM::Cookery::Facts.osrelease
    when '18.04'
      deps = 'libicu60', 'libcurl4'
    when '16.04'
      deps = 'libicu55', 'libcurl3'
    end
  end

  depends deps + common_deps

  osrelease  = FPM::Cookery::Facts.osrelease
  osplatform = FPM::Cookery::Facts.platform
  osrel      = osrelease.sub('.', '')

  source "#{homepage}/builds/" + \
    "swift-#{version}-release/" + \
    "#{osplatform}#{osrel}/" + \
    "swift-#{version}-RELEASE/" + \
    "swift-#{version}-RELEASE-#{osplatform}#{osrelease}.tar.gz"

  def build; end

  def install
    destdir("/").install Dir["*"]
  end

end
