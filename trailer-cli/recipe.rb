class TrailerCli < FPM::Cookery::Recipe
  name     'trailer-cli'
  version  '1.0.8'
  revision '3'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'GPL-2.0'

  build_depends 'swift-lang'

  homepage 'https://github.com/ptsochantaris/trailer-cli'
  source   "#{homepage}.git",
    :with => :git,
    :tag  => version

  description 'Managing Pull Requests and Issues For GitHub & GitHub Enterprise from the command line'

  def build
    build_options = '-c release -Xswiftc -Ounchecked -Xswiftc -whole-module-optimization'
    safesystem "swift build #{build_options}"
  end

  def install
    trailer_bin_path = `swift build -c release --show-bin-path`.strip + '/trailer'
    safesystem  "strip #{trailer_bin_path}"
    bin.install trailer_bin_path, 'trailer'
  end

end
