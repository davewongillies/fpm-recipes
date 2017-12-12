class VimbWebkit2 < FPM::Cookery::Recipe
  name     'vimb-webkit2'
  version  '3.0'
  revision 'alpha-1'

  description 'A fast and easy-to-use status bar'

  homepage 'https://github.com/fanglingsu/vimb'
  source   'https://github.com/fanglingsu/vimb.git',
    :with      => 'git',
    :ref       => 'd5901f54976733d9413b98974a533b08d33edf9e',
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
