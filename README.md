# Baukis

[![Build Status](https://travis-ci.org/ebkn12/Baukis.svg?branch=master)](https://travis-ci.org/ebkn12/Baukis)


## Description

Baukis is a customer management system for company.

This is sample for studying Ruby on Rails.

## Dependencies

- Ruby 2.5.1
- Rails 5.2.0
- MySQL

## Setup

```sh
$ git clone git@github.com:ebkn12/Baukis.git

$ cd baukis

$ bundle install --path vendor/bundle

$ rails db:setup

$ rails db:seed

$ rails s
```

## Development

Add host settings.
```
$ sudo vi /private/etc/hosts
```

Add following text in last line. (**Do not replace with exists**)
```sh
127.0.0.1 baukis.example.com example.com
```

Following links are URL for development.
```
administrators page
http://baukis.example.com/administrators

staff members page
http://baukis.example.com

customers page
http://example.com/mypage
```

Following lists are sample emails & passwords for development.
```
# administrator
admin@test.com
password

# staff_member
staff@test.com
password

# customer
customer@test.com
password
```

## Test

Run this command
```sh
$ rspec
```

then overage report is created by simpleCov gem.
```
/coverage/index.html
```
