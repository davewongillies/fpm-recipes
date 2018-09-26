class Smenu < FPM::Cookery::Recipe
  name 'smenu'
  version '0.9.14'
  revision '1'

  homepage "https://github.com/p-gen/#{name}"
  source "https://github.com/p-gen/#{name}.git",
    :with => 'git',
    :tag => "v#{version}"

  description 'Terminal utility that allows you to use words coming from the standard input to create a nice selection window just below the cursor.'
  license     'GPL-2.0'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'

  build_depends 'autoconf', 'autotools-dev', 'libncurses5-dev', 'libtool'

  def build
    safesystem './autogen.sh'
    configure :prefix => '/usr'
    make 'prefix' => '/usr'
  end

  def install
    make :install, 'DESTDIR' => destdir, 'PREFIX' => '/usr'
  end
end
