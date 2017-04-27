class Statsite < FPM::Cookery::Recipe
  name     'statsite'
  version  '0.8.0'
  revision '1'

  description 'C implementation of statsd'

  homepage "https://github.com/statsite/#{name}"
  source   "https://github.com/statsite/#{name}.git",
    :with      => 'git',
    :ref       => 'master'

  build_depends 'autoconf', 'automake', 'dh-autoreconf', 'libtool', 'pkg-config'

  def build
    configure
    make
  end

  def install
   make :install, 'DESTDIR' => destdir
  end

end
