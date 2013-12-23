require 'spec_helper'

describe Thumb do
  before { @thumb = Thumb.new(label: 'The Water Jet Pack', row: Row.new) }
  subject { @thumb }

  it { should respond_to(:active) }
  it { should respond_to(:label) }
  it { should respond_to(:image_path) }
  it { should respond_to(:row) }

  its(:active) { should be_false }
  its(:label) { should match Thumb::VALID_LABEL_REGEX }
  its(:image_path) { should be_blank }
  its(:row) { should_not be_nil }

  it { should be_valid }

  describe 'when label is blank' do
    before { @thumb.label = '' }

    it { should_not be_valid }
  end

  describe 'when label contains invalid characters' do
    it 'should be invalid' do
      ["Big@Lebowski 852", "Eat_my_duster"].each do |invalid_label|
        @thumb.label = invalid_label
        expect(@thumb).to_not be_valid
      end
    end
  end

  describe 'when label contains valid characters' do
    it 'should be valid' do
      ['The white house 911', 'eat-my-duster tom'].each do |valid_label|
        @thumb.label = valid_label
        expect(@thumb).to be_valid
      end
    end
  end

  describe 'when label is too long' do
    before { @thumb.label = 'A' * 21 }

    it { should_not be_valid }
  end

end
