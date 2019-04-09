#!/bin/bash

echo "*** Start Post Deploy sh ***"


bundle exec ruby ./review-apps-postdeploy.rb


echo "*** End ***"