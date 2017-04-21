RSpec::Matchers.define :unregister do |identifier|
  match do |actual|
    actual.unregister(identifier) == @instance
  end

  chain(:and_return) { |instance| @instance = instance }
end
