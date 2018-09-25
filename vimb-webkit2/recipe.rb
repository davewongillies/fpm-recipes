class VimbWebkit2 < FPM::Cookery::Recipe
  name     'vimb-webkit2'
  version  '3.2.0'
  revision '1'

  description 'Vimb is a Vim-like web browser that is inspired by Pentadactyl and Vimprobable.'
  license     'GPL-3.0'

  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'

  homepage 'https://github.com/fanglingsu/vimb'
  source   'https://github.com/fanglingsu/vimb.git',
    :with      => 'git',
    :tag       => version,
    :submodule => true

  build_depends 'libsoup2.4-dev', 'libgtk-3-dev', 'libwebkit2gtk-4.0-dev'
  depends       'libsoup2.4-1', 'libwebkit2gtk-4.0-37'

  conflicts 'vimb'

  def build
    make 'GTK=3'
  end

  def install
   make :install, 'PREFIX' => '/usr', 'DESTDIR' => destdir
  end

end
