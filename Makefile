readme: setup
	@bundle exec rake readme:recipe_table

setup:
	@bundle install

clean:
	@git clean -ffdx
