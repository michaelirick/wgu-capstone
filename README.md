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
bundle exec rails test
```

## Logging In and Managing Data

After navigating to the front-page, clicking on the Admin link in the top right
corner will bring you to the sign in page. The default credentials are email
address `admin@example.com`  and password `password`.

The administration panel allows authorized users to edit the various types of
data in the application, as well as add and remove access to users.

Each of the index views can be accessed via a link in the top  navigation bar.
The index views show a quick high-level view of each class of data, for
example, Animal. It features links to show more detailed information about each
object by clicking on the ID number. One can also delete multiple objects by
checking the left-hand box on each row, and selecting delete selected from the
batch actions button. Filters are also available as well as download capability
in CSV, XML, and JSON allowing simple reporting functionality, for example,
finding all the animals of a particular sire.

Clicking on the ID number on the index page, will bring you to the show view,
which shows more data than the index view, for example, an animal's images and
records, as well as administrator comments for each object. There are buttons
here to delete the object as well as edit the object. The edit view contains a
form with validations specific to that class.

Of particular note are the Dashboard Messages. This changes the text of the
About tab on the public catalog. They are ordered by their priority attribute.