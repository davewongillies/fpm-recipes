class Ctop < FPM::Cookery::Recipe
  name     'ctop'
  version  '0.7.1'
  revision '1'

  description 'Top-like interface for container metrics'

  homepage 'https://ctop.sh'
  source   "https://github.com/bcicen/ctop/releases/download/v#{version}/#{name}-#{version}-linux-amd64"
  license    'MIT'
  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'

  def build; end
  def install
    bin.install "#{name}-#{version}-linux-amd64", name
    chmod 0755, bin(name)
  end
end
