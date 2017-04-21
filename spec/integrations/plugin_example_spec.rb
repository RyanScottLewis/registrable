require 'spec_helper'

RSpec.describe 'Plugin example' do
  subject { Plugin }
  let(:plugins) { {} }

  it 'should return correctly' do
    expect(subject).to register(:mine, 'My Plugin').into(plugins)
    expect(subject).to be_registered(:mine)
    expect(subject).to have_registered(plugins[:mine]).as(:mine)
    expect(subject).to unregister(:mine).and_return(plugins[:mine])
    expect(subject).not_to be_registered(:mine)
  end
end
