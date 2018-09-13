class TrailerCli < FPM::Cookery::Recipe
  name     'trailer-cli'
  version  '1.0.8'
  revision '1'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'GPL-2.0'

  build_depends 'swift-lang'

  homepage 'https://github.com/ptsochantaris/trailer-cli'
  source   "#{homepage}.git", :with => :git, :tag => version

  description 'Managing Pull Requests and Issues For GitHub & GitHub Enterprise from the command line
'

  def build
    safesystem 'swift build -c release -Xswiftc -Ounchecked -Xswiftc -whole-module-optimization'
    safesystem 'strip $(swift build -c release --show-bin-path)/trailer'
    safesystem 'cp $(swift build -c release --show-bin-path)/trailer .'
  end

  def install
    bin.install 'trailer'
  end

end
