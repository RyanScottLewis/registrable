RSpec::Matchers.define :register do |identifier, *arguments|
  match do |actual|
    instance = actual.register(identifier, *arguments)
    @into[identifier] = instance if @into

    !instance.nil?
  end

  chain(:into) { |into| @into = into }
end
