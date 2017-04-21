# Registrable

## Install

### Bundler: `gem "registrable"`

### RubyGems: `gem install registrable`

## Usage

```rb
require 'registrable'

class Role
  def initialize(read, modify)
    @read, @modify = create, modify
  end

  def read?
    @read
  end

  def modify?
    @modify
  end
end

class User
  extend Registrable

  def initialize(role)
    self.role = role
  end

  attr_reader :role

  def role=(role)
    role = Role.registry[identifier] || Role.registry[:other] unless role.is_a?(Role)

    @role = role
  end
end

Role.register(:other, false, false)
Role.register(:user,  true,  false)
Role.register(:admin, true,  true)
```

```rb
other = User.new(:other)

p other.role.readable?   # => true
p other.role.modifiable? # => true

user = User.new(:user)

p admin.role.readable?   # => true
p admin.role.modifiable? # => false

admin = User.new(:admin)

p admin.role.readable?   # => true
p admin.role.modifiable? # => true
```

## Development

* `bin/setup` to install dependencies
* `bin/console` for an interactive prompt
* `bin/rake -T` to run view tasks
  * `bin/rake test` to test
  * `bin/rake lint` to lint
  * `bin/rake docs` to generate documentation
  * `bin/rake install` to install this gem onto your machine
  * `bin/rake` to test, lint, and generate documentation
* To release a new version
  * `bin/rake version:bump`
  * `bin/rake release` to create a git tag for the version, push git commits and tags, and push the gem to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RyanScottLewis/striker.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
