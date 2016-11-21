require 'rake'

desc "Test cook"
task :test do
  recipes = []
  changed_files = `git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRTUXB HEAD~1 HEAD -- **/recipe.rb **/config/*.yaml`
  changed_files.each_line {|line| recipes << line.split('/')[0]}
  if recipes
    recipes.sort.uniq.each do | recipe |
      Dir.chdir recipe do
        puts "===> Cooking recipe for #{recipe}"
        system "bundle exec fpm-cook" or raise "ERROR: Recipe failed to cook"
        system "dpkg-deb --info pkg/*.deb"
        system "dpkg-deb --contents pkg/*.deb"
      end
    end
  end
end
