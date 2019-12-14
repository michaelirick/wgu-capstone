# README

# Development

This README assumes that you have a PostgreSQL server, Ruby, NPM, and Yarn installed. If you do not have these setup, the following guides should be helpful:

* https://www.postgresql.org/download/
* https://www.ruby-lang.org/en/documentation/installation/
* https://nodejs.org/en/download/
* https://yarnpkg.com/lang/en/docs/cli/install/

It is also assumed that you know how to use a Linux (or other POSIX compliant OS). This application was developed on and for Ubuntu 18.04 LTS. If you are not using Ubuntu, then you may run into difficulties.

Clone repository:

```bash
git clone ssh://git@github.com/michaelirick/christies-companions
```

Install Ruby gems via bundler:

```bash
cd christies-companions
bundle install
```

Install Javascript packages via yarn:

```bash
yarn install
```

Copy the database example file and update with credentials:

```bash
cp config/database.yml.example config/database.yml
vim config/database.yml
```

Run database setup:

```bash
bundle exec rails db:create db:migrate db:seed
```

Start the development server:

```bash
bundle exec foreman start
```

Point your web browser to `localhost:5000` and get started!

## Testing

To run the test suite:

```bash
bundle exec rails test test/system
```
