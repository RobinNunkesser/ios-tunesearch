#!/bin/sh
cd TuneSearch
xcodebuild test -enableCodeCoverage YES -scheme TuneSearch -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 11' ONLY_ACTIVE_ARCH=NO
