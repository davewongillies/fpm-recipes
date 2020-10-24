class Xst < FPM::Cookery::Recipe
  name     'xst'
  version  '0.8.4'
  revision '1'

  description 'xst is a fork of st, which is a simple terminal implementation for X.'
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
    bin.install 'xst'
    man1.install 'st.1', 'doc/xst.1'
    doc(name).install ['FAQ', 'LEGACY', 'LICENSE', 'TODO', '.Xresources']
    share('applications').install workdir('xst.desktop')
  end

end
