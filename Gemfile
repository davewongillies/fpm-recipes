source 'https://rubygems.org'

group :deployment do
  gem 'rake', '< 12'
  gem 'httparty'
  gem 'dpkg-deb'
end

group :production do
  gem 'fpm-cookery',
      :git    => 'https://github.com/bernd/fpm-cookery.git',
      :branch => 'master'
end
