.PHONY: all setup

all:
	xcodebuild -workspace 'Guide.xcworkspace' -scheme 'Guide'|xcpretty

setup:
	bundle install
	bundle exec pod install #--no-repo-update
