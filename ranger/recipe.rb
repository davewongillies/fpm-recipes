class Ranger < FPM::Cookery::Recipe
  name          'ranger'
  description   'A VIM-inspired filemanager for the console http://ranger.nongnu.org/'
  version       '1.8.1'
  homepage      'https://github.com/ranger/ranger'
  source        "#{homepage}", :with => :git, :tag => "v#{version}"
  revision      '1'
  build_depends 'python-setuptools'
  depends       'python'
  maintainer    'Dave Wongillies <dave.gillies@gmail.com>'
  license       'GPL-3.0'

  def build
  end

  def install
    safesystem "python setup.py install --optimize=1 --prefix=#{destdir}/usr --install-layout=deb"
  end

end
