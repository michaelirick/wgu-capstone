#!/bin/bash

# add keys for yarn/npm
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | -E apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_13.x | -E bash -

# install prerequisite libraries
apt-get -y update
apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev git nodejs yarn postgresql libpq-dev libxml2 libxml2-dev libxslt1-dev libncurses5-dev

# install ruby
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
~/.rbenv/bin/rbenv init
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv rehash
rbenv install 2.6.5
rbenv rehash
rbenv global 2.6.5
gem install bundler

# setup database engine
cat << EOF | su - postgres -c psql
CREATE ROLE vagrant WITH PASSWORD 'password' LOGIN SUPERUSER;
EOF
rm config/database.yml
cp config/database.yml.example config/database.yml

# setup rails
bundle install
yarn install
bundle exec rails db:create db:migrate db:seed