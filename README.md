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
