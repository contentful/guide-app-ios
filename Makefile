# read value from Contentful configuration
get_config = $(shell grep -A 2 $1 ~/.contentfulrc|grep $2|cut -d' ' -f3)

.PHONY: all bootstrap setup

SPACE_NAME=my_guide

all:
	xcodebuild -workspace 'Guide.xcworkspace' -scheme 'Guide'|xcpretty

bootstrap:
	bundle install
	bundle exec contentful_bootstrap create_space $(SPACE_NAME) -j templates/guide.json

setup: bootstrap
	@pod keys set GuideSpaceId $(call get_config,$(SPACE_NAME),SPACE_ID)
	@pod keys set GuideAccesToken $(call get_config,$(SPACE_NAME),CONTENTFUL_DELIVERY_ACCESS_TOKEN)
	bundle exec pod install #--no-repo-update
