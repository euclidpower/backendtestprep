# SETUP

If you haven't coded in Ruby before - or it's been a while - these instructions should help you get the application setup and running on your machine.

If you do need to setup your machine, don't subtract that time from your 1.5 hours. We apologize for the extra trouble, and we want to be sure you have time to complete the test without rushing.

## Checking your environment

Before you get started, let's make sure you have the correct version of Ruby, Rails, and Bundler.

Verify you have Ruby 3.2.2 installed:

```bash
$ ruby -v
#=> ruby 3.2.2...
```

Verify you have Bundler 2.0+ installed:

```bash
$ bundler -v
#=> Bundler version 2...
```

Run bundler to install the gems (including Rails)

```bash
$ bundle install
#=> Bundle complete!...
```

Verify you have Rails 7+ installed:

```bash
$ rails -v
#=> Rails 7...
```

If all of the above are true, you're ready to continue! If one or more of the above are not true, you can use the [GoRails](https://gorails.com/setup) setup guide to help you install Ruby 3+, Rails 7+, and Bundler 2+ on your machine.

## Testing the application

Once you've setup your environment and cloned the repository to your machine, it's a good idea to run tests and verify it installed correctly:

```bash
~/backend-test $ rails test
```

If all but one of the tests succeed, you're ready to continue! If not, you'll need to troubleshoot any issues before continuing.

## Creating the database

Before we start the application, let's create and seed the database:

```bash
~/backend-test $ rails db:setup
#=> Created database 'db/development.sqlite3'
#=> Created database 'db/test.sqlite3'
```

If the operation succeeded, users, currencies, and rates (i.e., the things in `db/seeds.rb`) should exist. You can verify they do using the Rails console and Rails [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html#crud-reading-and-writing-data) query interface:

```bash
~/backend-test $ rails console
Loading development environment (Rails 7.0.4)
irb(main):001:0> User.count
  User Count (1.6ms)  SELECT COUNT(*) FROM "users"
=> 1
```

## Starting the application

Rails includes a development server, which we'll use to serve our application from your machine.

Start the rails server from the repository's directory:

```bash
~/backend-test $ rails server
```

This should produce output similar to the following:

```bash
~/backend-test $ rails server
=> Rails 7.0.4 application starting in development
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 5.6.5 (ruby 3.0.2-p107) ("Birdie's Version")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 73622
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
```

Navigate to `http://localhost:3000`, and you should see the Rails welcome screen.

If so, the example application is up and running. If not, you'll need to troubleshoot any issues before continuing.

## Hitting the example endpoint

Now, it's time to hit the example endpoint. Since the API expects JSON requests, we'll use `curl`.

Before we do, though, we need to query an API key. Open the Rails console:

```bash
~/backend-test $ rails console
Loading development environment (Rails 7.0.4)
irb(main):001:0>
```

Query the API key of the first user:

```bash
irb(main):001:0> User.first.api_key
  User Load (0.3ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> "YOUR_API_KEY"
```

Send the cURL request to the existing `currencies#index` endpoint:

```bash
~/backend-test $ curl 'http://localhost:3000/currencies?api_key=YOUR_API_KEY'
#=> [{"id":1,"name":"US Dollar","code":"USD"},{"id":2,"name":"Euro","code":"EUR"}]
```
