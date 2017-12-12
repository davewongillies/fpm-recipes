class Tflint < FPM::Cookery::Recipe
  description 'TFLint is a Terraform linter for detecting errors that can not be detected by terraform plan'

  name       'tflint'
  version    '0.5.3'
  revision   '1'
  arch       'x86_64'
  homepage   "https://github.com/wata727/#{name}"
  source     "#{homepage}/releases/download/v#{version}/#{name}_linux_amd64.zip"
  maintainer 'Dave Wongillies <dave.gillies@gmail.com>'
  license    'MIT'

  build_depends 'unzip'

  def build; end

  def install
    bin.install "tflint"
  end

end
