#! /bin/sh
set -e

#bundle exec rake db:create
#bundle exec rake db:migrate
bundle exec rails server -b 0.0.0.0
