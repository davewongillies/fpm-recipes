NAME=davewongillies/fpm-cookery
RELEASES=ubuntu-xenial debian-jessie debian-wheezy

build:
	$(foreach release,$(RELEASES),docker build --pull --rm --tag $(NAME):$(release) -f Dockerfile.$(release) .;)

push:
	$(foreach release,$(RELEASES),docker push $(NAME):$(release);)

all:
	build
