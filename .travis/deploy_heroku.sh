#!/bin/sh
wget -qO- https://toolbelt.heroku.com/install.sh | sh
heroku plugins:install @heroku-cli/plugin-container-registry
docker login -u lokatheloka@gmail.com --password=$HEROKU_API_KEY registry.heroku.com
heroku container:push web --app $HEROKU_APP_NAME
heroku container:release web --app $HEROKU_APP_NAME
heroku open