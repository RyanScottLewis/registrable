require 'spec_helper'

RSpec.describe 'Plugin example' do
  subject { Plugin }
  let(:plugins) { {} }

  it 'should return correctly' do
    expect(subject.registry.keys).to eq(%i[my_plugin another_plugin])
    expect(subject.registry[:my_plugin]).to eq(MyPlugin)
    expect(subject.registry[:another_plugin]).to eq(AnotherPlugin)
  end
end
