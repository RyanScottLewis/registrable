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
      expect(subject.register(:foo, :bar)).to eq(:bar)
    end
  end

  describe '.unregister' do
    before { subject.register(:foo, :bar) }

    it 'should return correctly' do
      expect(subject.unregister(:foo)).to eq(:bar)
      expect(subject).not_to be_registered(:foo)
    end
  end

  describe '.registered?' do
    before { subject.register(:foo, :bar) }

    it 'should return correctly' do
      expect(subject).to be_registered(:foo)
      expect(subject).not_to be_registered(:qux)
    end
  end
end
