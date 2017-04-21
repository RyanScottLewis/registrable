require 'spec_helper'

RSpec.describe Registrable do
  subject { Class.new { extend Registrable } }

  describe '.registry' do
    it 'should return correctly' do
      expect(subject.registry).to eq({})
      expect(subject.registry).to be_frozen
    end
  end

  describe '.register' do
    it 'should return correctly' do
      expect(subject).to register(:mine)
    end
  end

  describe '.unregister' do
    let(:plugins) { {} }

    it 'should return correctly' do
      expect(subject).to register(:mine).into(plugins)
      expect(subject).to unregister(:mine).and_return(plugins[:mine])
    end
  end

  describe '.registered?' do
    it 'should return correctly' do
      expect(subject).to register(:mine)
      expect(subject).to be_registered(:mine)
    end
  end
end
