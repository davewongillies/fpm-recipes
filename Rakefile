require 'rake'

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
          system 'find -type f -name "*.deb" -exec dpkg-deb --info {} \;'
          system 'find -type f -name "*.deb" -exec dpkg-deb --contents {} \;'
          puts "===> Finished cooking #{recipe} on #{distro}"
        end
      end
    else
      puts "===> No recipes changed to build on #{distro}"
    end
  end

  desc "Test docker build"
  task :build do
    distro  = ENV['distro'] || 'ubuntu-xenial'
    dockerfiles = []
    puts "===> Test docker build for #{distro}"

    changed_dockerfiles = `git diff-tree -r --no-commit-id --name-only --diff-filter=ACMRTUXB HEAD~1 HEAD -- Dockerfile.#{distro}`
    changed_dockerfiles.each_line {|line| dockerfiles << line}

    if dockerfiles.length > 0
      system "docker build Dockerfile.#{distro}" or raise "ERROR: Failed Dockerfile.#{distro}"
    else
      puts "===> No Dockerfile changed for #{distro}"
    end
  end

end
