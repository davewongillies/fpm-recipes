class DockerCompose < FPM::Cookery::Recipe
  name        'docker-compose'
  description 'Define and run multi-container applications with Docker'
  homepage    'https://github.com/docker/compose'
  license     'Apache-2.0'

  maintainer  'Dave Wongillies <dave.gillies@gmail.com>'

  version  '1.22.0'
  revision '1'

  source "#{homepage}/releases/download/#{version}/#{name}-Linux-x86_64"

  def build; end

  def install
    bin.install "#{name}-Linux-x86_64", name
    chmod 0755, bin(name)
  end

end
