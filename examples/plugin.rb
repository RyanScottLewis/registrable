require 'registrable'

module Plugin

  extend Registrable

  class Base
    def self.inherited(subclass)
      identifier = subclass.to_s
        .split('::').last
        .gsub(/([a-z0-9])([A-Z])/, '\1_\2')
        .downcase.to_sym

      Plugin.register(identifier, subclass)
    end
  end

end

class MyPlugin < Plugin::Base; end
class AnotherPlugin < Plugin::Base; end
