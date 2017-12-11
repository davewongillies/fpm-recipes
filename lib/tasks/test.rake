require 'rake'
require 'dpkg/deb'

namespace :test do

  desc "Test fpm-cook"
  task :cook do
    distro  = ENV['distro'] || 'ubuntu-xenial'
    recipes = []
    puts "===> Executing test for #{distro}"

    changed_recipes = `git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRTUXB HEAD~1 HEAD -- **/recipe.rb **/config/*.yaml`
    changed_recipes.each_line {|line| recipes << line.split('/')[0]}

    if recipes.length > 0
      recipes.sort.uniq.each do | recipe |
        Dir.chdir recipe do
          puts "===> Cooking #{recipe} on #{distro}"
          system "docker run -e pkg_dir_uid=$(id -u) --rm -v $PWD:/data davewongillies/fpm-recipes:#{distro}" or raise "ERROR: Failed to cook #{recipe} on #{distro}"
          Dir['pkg/**/*.deb'].each do |deb|
            system "dpkg-deb -f #{deb}"
            system "dpkg-deb --contents #{deb}"
          end
          puts "===> Finished cooking #{recipe} on #{distro}"
        end
      end
    else
      puts "===> No recipes changed to build on #{distro}"
    end
  end

  desc "Test changed docker build"
  task :build do
    dockerfiles = []
    changed_dockerfiles = `git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRTUXB HEAD~1 HEAD -- Dockerfile.*`
    changed_dockerfiles.each_line {|line| dockerfiles << line.split('/')[0]}

    dockerfiles.each do | dockerfile |
      puts "===> Test dockerfile #{dockerfile}"
      system "docker build -f #{dockerfile} ." or raise "ERROR: Failed #{dockerfile}"
    end
  end

end
