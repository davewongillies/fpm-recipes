require 'json'
require 'erb'
namespace :readme do
  desc "Generate table of recipes for README.md"
  task :recipe_table do
    puts "===> Generating README.md"
    recipes      = Dir['*/recipe.rb']
    recipe_table = []

    recipes.each do |recipe|
     r = `bundle exec fpm-cook inspect #{recipe}`
     r = JSON.parse(r)
     recipe_table << "|[#{r['name']}](#{r['homepage']})|#{r['description']}|"
    end

    readme_template = File.read('lib/tasks/README.md.erb')
    readme_render = ERB.new(readme_template, nil, '-')
    File.write('README.md', readme_render.result(binding))

  end
end
