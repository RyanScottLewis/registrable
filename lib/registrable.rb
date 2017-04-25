require 'registrable/version'

# Allow a class to hold a registry, which is a frozen Hash which can only be modified using the #register and
# #unregister methods
module Registrable

  # All registered objects
  #
  # @return [Hash]
  def registry
    @registry ||= {}.freeze
  end

  # Register an object
  #
  # @param [Object] identifier
  # @param [Class] registrant The object to register
  # @return [Class] The registrant
  def register(identifier, registrant)
    @registry = @registry ? registry.dup : {}

    @registry[identifier] = registrant
    @registry.freeze

    registrant
  end

  # Unregister an object
  #
  # @param [Object] identifier
  # @return [Object] The registrant
  def unregister(identifier)
    @registry = @registry ? registry.dup : {}

    registrant = @registry.delete(identifier)
    @registry.freeze

    registrant
  end

  # Get whether an object is registered
  #
  # @param [Object] identifier
  # @return [Boolean]
  def registered?(identifier)
    registry.key?(identifier)
  end

end
