require 'registrable'

class Plugin

  extend Registrable

  def initialize(name)
    @name = name
  end

  attr_reader :name

end

unless ENV['RSPEC'] # Not loading this file from tests
  p Plugin.register(:my_plugin, 'My Plugin') # => #<Plugin:0x0001 @name="My Plugin">
  p Plugin.registered?(:my_plugin)           # => true
  p Plugin.registry[:my_plugin]              # => #<Plugin:0x0001 @name="My Plugin">
  p Plugin.unregister(:my_plugin)            # => #<Plugin:0x0001 @name="My Plugin">
  p Plugin.registered?(:my_plugin)           # => false
end
