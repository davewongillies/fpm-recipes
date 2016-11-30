class DockerCompose < FPM::Cookery::Recipe
  name "docker-compose"
  version "1.9.0"
  revision "1"
  homepage 'https://github.com/docker/compose'
  source "#{homepage}/releases/download/#{version}/docker-compose-Linux-x86_64"

  def build
  end

  def install
    bin.install "docker-compose-Linux-x86_64", 'docker-compose'
    chmod 0755, bin('docker-compose')
  end

end
