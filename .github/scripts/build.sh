#!/bin/sh
gem install xcpretty
cd TuneSearch
set -o pipefail && xcodebuild test -enableCodeCoverage YES \
  -workspace TuneSearch.xcworkspace -scheme TuneSearch -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 11' ONLY_ACTIVE_ARCH=NO \
  | xcpretty
