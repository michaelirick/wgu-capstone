#!/bin/bash

su - vagrant
cd /home/vagrant
echo "Should be vagrant now"
pwd

# add keys for yarn/npm
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo -E apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -

echo "Should be vagrant now"
pwd

sudo su - vagrant

# install prerequisite libraries
sudo apt-get -y update
sudo apt-get -y install autoconf bison build-essential gcc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev git nodejs yarn postgresql libpq-dev libxml2 libxml2-dev libxslt1-dev libncurses5-dev graphviz

# setup database engine
cat << EOF | sudo su - postgres -c psql
CREATE ROLE vagrant WITH PASSWORD 'password' LOGIN SUPERUSER;
EOF

# test
PGPASSWORDS=password psql -U vagrant postgres -c "\\l"

# install ruby
git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
export PATH="/home/vagrant/.rbenv/bin:$PATH"
export PATH="/home/vagrant/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv rehash
pwd
rbenv install 2.4.1
rbenv rehash
rbenv global 2.4.1
gem install bundler

# setup rails
cd /vagrant
rm config/database.yml
cp config/database.yml.example config/database.yml
yarn install
bundle install
migrate=1 bundle exec rails db:create
migrate=1 bundle exec rails db:migrate db:seed
bundle exec rails webpacker:binstubs