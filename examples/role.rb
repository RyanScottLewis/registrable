require 'registrable'

class Role

  extend Registrable

  def initialize(readable, modify)
    @readable, @modifiable = readable, modify
  end

  def readable?
    @readable
  end

  def modifiable?
    @modifiable
  end

end

class User

  def initialize(role)
    self.role = role
  end

  attr_reader :role

  def role=(role)
    role = Role.registry[role] || Role.registry[:other] unless role.is_a?(Role)

    @role = role
  end

end

Role.register(:other, Role.new(false, false))
Role.register(:user,  Role.new(true,  false))
Role.register(:admin, Role.new(true,  true))
