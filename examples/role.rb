require 'registrable'

class Role
  extend Registrable

  def initialize(readable, modifiable)
    @readable, @modifiable = readable, modifiable
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

Role.register(:other, false, false)
Role.register(:user,  true,  false)
Role.register(:admin, true,  true)
