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
    # Crappy workaround for installing build_depends because fpm-cookery uses
    # puppet 3.x, Ubuntu Xenial uses ruby 2.3 and they aren't compatible
    case FPM::Cookery::Facts.osmajorrelease
    when "16.04"
     FPM::Cookery::Log.info "Installing build_depends: #{build_depends.join(' ')}"
     safesystem "apt-get update ; apt-get install --no-install-recommends -y #{build_depends.join(' ')}"
    end

    make 'GTK=3'
  end

  def install
   make :install, 'PREFIX' => '/usr', 'DESTDIR' => destdir
  end

end
