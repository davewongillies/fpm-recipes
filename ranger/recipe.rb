class Ranger < FPM::Cookery::Recipe
  name        'ranger'
  description 'A VIM-inspired filemanager for the console'
  version     '1.9.3'
  revision    '1'
  homepage    'https://github.com/ranger/ranger'
  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'
  license     'GPL-3.0'

  source homepage,
    :with => :git,
    :tag  => "v#{version}"

  build_depends 'python3-setuptools'
  depends       'python3'

  def build; end

  def install
    safesystem "python3 setup.py install --optimize=1 --prefix=#{destdir}/usr --install-layout=deb"
  end

end
