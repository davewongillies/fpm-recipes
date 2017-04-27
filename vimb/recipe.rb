class Vimb < FPM::Cookery::Recipe
  name 'vimb'
  version '2.11'
  revision '2-5867b7'

  homepage "https://github.com/fanglingsu/#{name}"
  source "https://github.com/fanglingsu/#{name}.git",
    :with      => 'git',
    :tag       => '5867b7b413b7cbdf1367781e5244a50465ec2af9',
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
