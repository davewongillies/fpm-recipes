class Vimb < FPM::Cookery::Recipe
  name     'vimb'
  version  '3.6.0'
  revision '2'

  description 'Vimb is a Vim-like web browser that is inspired by Pentadactyl and Vimprobable.'
  license     'GPL-3.0'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'

  homepage "https://github.com/fanglingsu/#{name}"
  source   "https://github.com/fanglingsu/#{name}.git",
    :with      => 'git',
    :tag       => version,
    :submodule => true

  build_depends 'libwebkit2gtk-4.0-dev'
  depends       'libwebkit2gtk-4.0-37'

  def build
    make
  end

  def install
   make :install, 'PREFIX' => '/usr', 'DESTDIR' => destdir
  end

end
