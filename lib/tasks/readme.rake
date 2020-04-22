require 'fpm/cookery/book_hook'
require 'fpm/cookery/recipe'
require 'fpm/cookery/config'

namespace :readme do
  desc "Generate table of recipes for README.md"
  task :recipe_table do
    puts "===> Generating README.md"

    config = FPM::Cookery::Config.new
    config.skip_package = true
    FPM::Cookery::BaseRecipe.send(:include, FPM::Cookery::BookHook)

    recipes = []
    Dir["*/recipe.rb"].each do |recipe_file|
      FPM::Cookery::Book.instance.load_recipe(recipe_file, config) do |recipe|
        recipes << recipe
      end
    end

    recipe_table = []
    recipes.sort_by {|a| a.name}.each do |r|
     recipe_table << "|[#{r.name}](#{r.homepage})|#{r.version}-#{r.revision}|#{r.description}|"
    end

    readme_template = File.read('lib/tasks/README.md.erb')
    readme_render = ERB.new(readme_template, nil, '-')
    File.write('README.md', readme_render.result(binding))

  end
end
