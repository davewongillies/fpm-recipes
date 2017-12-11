require 'httparty'
require 'dpkg/deb'
require 'json'

module Bintray
  class Package
    include HTTParty
    base_uri 'https://api.bintray.com'

    def initialize(u, p, s=u)
      @auth = { username: u, password: p }
      @subject = s
    end

    def get_package(name, repo)
      response = self.class.get("/packages/#{@subject}/#{repo}/#{name}")

      puts "#{__method__}: #{name}: #{response['message']}"

      response.code == 200
    end

    def create_package(name,
                       repo,
                       licenses=[],
                       vcs_url='https://github.com/davewongillies/fpm-recipes.git')

      payload = { name: name,
                  licenses: licenses,
                  vcs_url: vcs_url }

      headers = { 'Accept'       => 'application/json',
                  'Content-Type' => 'application/json' }

      options = { basic_auth: @auth,
                  headers: headers,
                  body: payload.to_json }

      response = self.class.post("/packages/#{@subject}/#{repo}", options)

      puts "#{__method__}: #{name}: #{response['message']}"

      response.code == 201
    end

    def upload_package(file_path, repo, distro, component)
      fields  = Dpkg::Deb.fields(file_path)

      fn      = File.basename(file_path)
      repo_fp = "pool/#{component}/#{fields['Package'][0]}/#{fields['Package']}/#{fn}"

      if not get_package(fields['Package'], repo)
        create_package(fields['Package'], repo, [fields['License']])
      end

      headers = { 'X-Bintray-Debian-Distribution' => distro,
                  'X-Bintray-Debian-Component'    => component,
                  'X-Bintray-Debian-Architecture' => fields['Architecture']
      }

      options = { basic_auth: @auth, headers: headers, body: open(file_path).read }

      response = self.class.put("/content/#{@subject}/#{repo}/#{fields['Package']}/#{fields['Version']}/#{repo_fp};publish=1", options)

      puts "#{__method__}: #{fields['Package']}: #{response['message']}"

      response.code == 201
    end

    def publish_package(name, repo, version)
      options = { basic_auth: @auth }
      response = self.class.post("/content/#{@subject}/#{repo}/#{name}/#{version}/publish", options)
      puts "#{__method__}: #{name}: #{response['message']}"

      response.code == 200
    end

  end
end
