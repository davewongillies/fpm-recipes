class Vimb < FPM::Cookery::Recipe
  name     'vimb'
  version  '2.12'
  revision '4'

  description 'Vimb is a Vim-like web browser that is inspired by Pentadactyl and Vimprobable.'
  license     'GPL-3.0'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'

  homepage "https://github.com/fanglingsu/#{name}"
  source   "https://github.com/fanglingsu/#{name}.git",
    :with      => 'git',
    :tag       => version,
    :submodule => true

  build_depends 'libsoup2.4-dev', 'libwebkit-dev', 'libgtk-3-dev', 'libwebkitgtk-3.0-dev'
  depends       'libsoup2.4-1', 'libwebkitgtk-3.0-0'

  def build
    make 'GTK=3'
  end

  def install
   make :install, 'PREFIX' => '/usr', 'DESTDIR' => destdir
  end

end
