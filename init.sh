set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
RAILS_ENV=production bundle exec rails assets:precompile
RAILS_ENV=production bundle exec rails assets:clean
RAILS_ENV=production bundle exec rails db:migrate
bundle exec rails s -p 3000 -b '0.0.0.0' -e production
