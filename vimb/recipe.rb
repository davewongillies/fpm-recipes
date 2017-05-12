class Vimb < FPM::Cookery::Recipe
  name 'vimb'
  version '2.12'
  revision '1-webkit2'

  homepage "https://github.com/fanglingsu/#{name}"
  source "https://github.com/fanglingsu/#{name}.git",
    :with      => 'git',
    :branch    => 'webkit2',
    :submodule => true

  description 'A fast and easy-to-use status bar'
  build_depends 'libsoup2.4-dev', 'libwebkit2gtk-4.0-dev'

  def build
    make 'GTK=3'
  end

  def install
   make :install, 'PREFIX' => '/usr', 'DESTDIR' => destdir
  end

end
