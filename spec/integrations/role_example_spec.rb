require 'spec_helper'

RSpec.describe 'Role example' do
  let(:user) { User.new(:admin) }
  subject { user.role }

  it { should be_readable }
  it { should be_modifiable }
end
