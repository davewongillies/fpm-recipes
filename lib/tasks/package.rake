$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "/.."))
require 'rake'
require 'bintray/package'

namespace :package do
  desc 'publish package'
  task :publish do
    username  = ENV['BINTRAY_API_USER']
    password  = ENV['BINTRAY_API_KEY']
    repo      = ENV['repo']
    distro    = ENV['distro']
    component = ENV['component']

    bt = Bintray::Package.new(username, password)

    Dir['*/**/*.deb'].each do |deb|
      bt.upload_package(deb, repo, distro, component)
    end
  end
end
