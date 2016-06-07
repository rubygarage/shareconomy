[![Build Status](https://travis-ci.org/rubygarage/shareconomy.svg?branch=master)](https://travis-ci.org/rubygarage/shareconomy)
[![Code Climate](https://codeclimate.com/repos/5756a4f0b77fe41667003418/badges/98628f86f405cb14ad5c/gpa.svg)](https://codeclimate.com/repos/5756a4f0b77fe41667003418/feed)
[![Test Coverage](https://codeclimate.com/repos/5756a4f0b77fe41667003418/badges/98628f86f405cb14ad5c/coverage.svg)](https://codeclimate.com/repos/5756a4f0b77fe41667003418/coverage)
# Shareconomy
Simple Rails-based marketplace (Engine)

# Installation
Add to Gemfile:
```ruby
gem 'shareconomy', github: 'RubyGarage/shareconomy'
```

Run bundle install:
```
bundle install
```

Add to routes:
```ruby
mount Shareconomy::Engine => "/"
```
