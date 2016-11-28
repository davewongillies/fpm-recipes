class Ranger < FPM::Cookery::Recipe
  name          'ranger'
  description   'A VIM-inspired filemanager for the console http://ranger.nongnu.org/'
  version       '1.7.2'
  homepage      'https://github.com/ranger/ranger'
  source        "#{homepage}", :with => :git, :tag => "v#{version}"
  revision      '1'
  build_depends 'python-setuptools'
  depends       'python'

  def build
    # Crappy workaround for installing build_depends because fpm-cookery uses
    # puppet 3.x, Ubuntu Xenial uses ruby 2.3 and they aren't compatible
    case FPM::Cookery::Facts.osmajorrelease
    when "16.04"
     FPM::Cookery::Log.info "Installing build_depends: #{build_depends.join(' ')}"
     safesystem "apt-get update ; apt-get install -y #{build_depends.join(' ')}"
    end
  end

  def install
    safesystem "python setup.py install --optimize=1 --prefix=#{destdir}/usr --install-layout=deb"
  end

end
