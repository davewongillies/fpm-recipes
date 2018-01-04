class LastPassCli < FPM::Cookery::Recipe


  name     'lastpass-cli'
  version  '1.2.2'
  revision '4'

  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'GPL-2.0'

  homepage "https://github.com/lastpass/#{name}"
  source   "https://github.com/lastpass/#{name}.git",
    :with => 'git',
    :tag  => "v#{version}"

  description 'A fast and easy-to-use status bar'

  build_depends 'libcurl4-openssl-dev',
    'libssl-dev',
    'libxml2-dev',
    'cmake',
    'bash-completion',
    'pkg-config',
    'xsltproc',
    'asciidoc',
    'docbook-xsl'

  depends 'openssl', 'pinentry-curses', 'xclip'

  def build
    make
    make 'doc-man'
  end

  def install
   make :install, 'DESTDIR' => destdir
   man1.install 'build/lpass.1'
   doc(name).install 'contrib/examples'
   share('fish/vendor_completions.d').install 'contrib/completions-lpass.fish', 'lpass.fish'
  end

end
