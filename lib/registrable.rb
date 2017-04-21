require 'registrable/version'

# Allow a class to hold a registry of instances
module Registrable

  # All registered instances
  #
  # @return [Hash]
  def registry
    @registry ||= {}.freeze
  end

  # Register an instance
  #
  # @param [Object] identifier
  # @param [Array] arguments The arguments to pass to #initialize
  # @param [Proc] block The block to pass to #initialize
  # @return [Object] The instance
  def register(identifier, *arguments, &block)
    @registry = @registry ? registry.dup : {}

    instance = new(*arguments, &block)

    @registry[identifier] = instance
    @registry.freeze

    instance
  end

  # Unregister an instance
  #
  # @param [Object] identifier
  # @return [Object] The instance
  def unregister(identifier)
    @registry = @registry ? registry.dup : {}

    instance = @registry.delete(identifier)
    @registry.freeze

    instance
  end

  # Get whether an instance is registered
  #
  # @param [Object] identifier
  # @return [Boolean]
  def registered?(identifier)
    registry.key?(identifier)
  end

end
