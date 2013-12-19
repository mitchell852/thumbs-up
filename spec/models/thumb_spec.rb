require 'spec_helper'

describe Thumb do
  before { @thumb = Thumb.new(label: 'The Water Jet Pack') }
  subject { @thumb }

  it { should respond_to(:active) }
  it { should respond_to(:label) }
  it { should respond_to(:image_path) }

  its(:active) { should be_false }
  its(:label) { should == 'The Water Jet Pack' }
  its(:image_path) { should be_blank }

  it { should be_valid }

  describe 'when label is blank' do
    before { @thumb.label = '' }

    it { should_not be_valid }
  end
end
