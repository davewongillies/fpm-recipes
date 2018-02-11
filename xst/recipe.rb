class Xst < FPM::Cookery::Recipe
  name     'xst'
  version  '0.7.1'
  revision '4'

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
    bin.install 'st'
    man1.install 'doc/st.1'
    doc(name).install ['doc/FAQ', 'doc/LEGACY', 'doc/LICENSE', 'doc/TODO.md', 'doc/Xresources']
    share('applications').install workdir('st.desktop')
  end

end
