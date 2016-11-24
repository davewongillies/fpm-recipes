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
        system "docker run -e pkg_dir_uid=$(id -u) --rm -v $PWD:/data davewongillies/fpm-recipes:debian-jessie" or raise "ERROR: Recipe failed to cook"
        system 'find -type f -name "*.deb" -exec dpkg-deb --info {} \;'
        system 'find -type f -name "*.deb" -exec dpkg-deb --contents {} \;'
      end
    end
  end
end
