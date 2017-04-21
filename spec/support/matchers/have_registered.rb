RSpec::Matchers.define :have_registered do |instance|
  match do |actual|
    actual.registry[@identifier] == instance
  end

  chain(:as) { |identifier| @identifier = identifier }
end
