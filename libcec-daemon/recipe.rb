class LibcecDaemon < FPM::Cookery::Recipe
  name 'libcec-daemon'
  version '0.9.5'
  revision '1'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'BSD 2-Clause'

  homepage "https://github.com/benklop/#{name}"
  source "#{homepage}.git",
    :with => 'git'

  description 'A Linux daemon for connecting libcec to uinput. That is, using your TV to control your PC!'
  build_depends 'build-essential',
    'autoconf',
    'cmake',
    'libboost-program-options-dev',
    'libboost-system-dev',
    'libboost-thread-dev',
    'libcec-platform-dev',
    'liblog4cplus-dev',
    'libcec-dev'

  case FPM::Cookery::Facts.platform
  when :ubuntu
    case FPM::Cookery::Facts.osrelease
    when '16.04'
      depends 'libcec3',
        'libboost-program-options1.58.0',
        'libboost-system1.58.0',
        'libboost-thread1.58.0',
        'liblog4cplus-1.1-9'
    end
  when :debian
    case FPM::Cookery::Facts.osrelease
    when '8.0'
      depends 'libcec3',
        'libboost-program-options1.55.0',
        'libboost-system1.55.0',
        'libboost-thread1.55.0',
        'liblog4cplus-1.0-4'
    end
  end

  def build
    safesystem 'cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr'
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end

end
