class Vimb < FPM::Cookery::Recipe
  name 'vimb'
  version '2.12'
  revision '3'

  homepage "https://github.com/fanglingsu/#{name}"
  source "https://github.com/fanglingsu/#{name}.git",
    :with      => 'git',
    :tag       => version,
    :submodule => true

  description 'A fast and easy-to-use status bar'
  build_depends 'libsoup2.4-dev', 'libwebkit-dev', 'libgtk-3-dev', 'libwebkitgtk-3.0-dev'
  depends 'libwebkitgtk-3.0-0', 'libsoup2.4-1'

  def build
    make 'GTK=3'
  end

  def install
   make :install, 'PREFIX' => '/usr', 'DESTDIR' => destdir
  end

end
