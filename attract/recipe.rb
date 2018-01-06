class Attract < FPM::Cookery::Recipe
  name     'attract'
  version  '2.3.0'
  revision '1'

  description 'A graphical front-end for command line emulators that hides the underlying operating system and is intended to be controlled with a joystick or gamepad'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'GPL-3.0'

  homepage 'http://www.attractmode.org'
  source   "https://github.com/mickelson/#{name}.git",
    :with => 'git',
    :tag  => "v#{version}"

  build_depends 'libarchive-dev',
                'libarchive-dev',
                'libavcodec-dev',
                'libavformat-dev',
                'libavresample-dev',
                'libfontconfig-dev',
                'libfreetype6-dev',
                'libglu-dev',
                'libjpeg-dev',
                'libopenal-dev',
                'libsfml-dev',
                'libswscale-dev',
                'libxinerama-dev'

  def build
    make 'prefix' => '/usr'
  end

  def install
    make :install, 'DESTDIR' => destdir, 'prefix' => '/usr'

    share('appdata').install 'util/linux/attract-mode.appdata.xml'
    share('applications').install 'util/linux/attract-mode.desktop'
    share('icons/hicolor/512x512/apps').install 'util/linux/attract-mode.png'
  end

end
