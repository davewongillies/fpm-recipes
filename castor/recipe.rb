class Castor < FPM::Cookery::Recipe
  name 'castor'
  version '0.8.16'
  revision '2'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'MIT'

  homepage "https://git.sr.ht/~julienxx/#{name}"
  source "https://git.sr.ht/~julienxx/#{name}",
    :with      => 'git',
    :submodule => true

  description 'A Browser for the small internet (Gemini, Gopher, Finger)'
  build_depends 'build-essential',
    'rustc',
    'cargo',
    'desktop-file-utils',
    'libgtk-3-dev',
    'libgdk-pixbuf2.0-dev',
    'libssl-dev'

  def build
    make
  end

  def install
   make :install, 'DESTDIR' => destdir
  end

end
