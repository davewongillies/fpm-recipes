class Terraform < FPM::Cookery::Recipe
  name "terraform"
  description "Terraform is a tool for building, changing, and combining infrastructure safely and efficiently"
  version "0.9.6"
  revision "1"
  homepage "https://github.com/hashicorp/#{name}"
  source "https://releases.hashicorp.com/#{name}/#{version}/#{name}_#{version}_linux_amd64.zip"
  build_depends 'unzip'

  def build
  end

  def install
    sbin.install "terraform"
  end

end
