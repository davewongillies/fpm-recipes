class Runc < FPM::Cookery::Recipe
  name 'runc'
  version '1.0.0-rc2'
  revision '1'

  homepage 'https://github.com/opencontainers/runc'
  source   "#{homepage}/releases/download/v#{version}/runc-linux-amd64"
  sha256   'a0273bcf49385b585aa8fedd3a2d1a34a22ae7954829855f7a561cc5269ec8e4'

  description 'CLI tool for spawning and running containers according to the OCI specification'

  license 'Apache'
  vendor 'OCI'

  def build
  end

  def install
    bin.install 'runc-linux-amd64', 'runc'
    chmod 0755, bin('runc')
  end
end
