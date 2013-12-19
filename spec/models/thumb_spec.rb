require 'spec_helper'

describe Thumb do
  before { @thumb = Thumb.new(label: 'The Water Jet Pack', row: Row.new) }
  subject { @thumb }

  it { should respond_to(:active) }
  it { should respond_to(:label) }
  it { should respond_to(:image_path) }
  it { should respond_to(:row) }

  its(:active) { should be_false }
  its(:label) { should == 'The Water Jet Pack' }
  its(:image_path) { should be_blank }
  its(:row) { should_not be_nil }

  it { should be_valid }

  describe 'when label is blank' do
    before { @thumb.label = '' }

    it { should_not be_valid }
  end

  describe 'when label is too long' do
    before { @thumb.label = 'A' * 21 }

    it { should_not be_valid }
  end
end
