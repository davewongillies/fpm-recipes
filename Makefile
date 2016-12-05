NAME=fpm-recipes
HUB_USER=davewongillies
RELEASES=ubuntu-xenial debian-jessie debian-wheezy

build:
	$(foreach release,$(RELEASES),docker build --pull --rm --tag $(HUB_USER)/$(NAME):$(release) --tag $(NAME):$(release) -f Dockerfile.$(release) .;)

push:
	$(foreach release,$(RELEASES),docker push $(HUB_USER)/$(NAME):$(release);)

all:
	build
