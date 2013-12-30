require 'spec_helper'

describe Row do
  before { @row = Row.new(title: 'Row title') }

  it { should respond_to(:thumbs) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:link_url) }

  it 'changes the number of rows by 1 when saved' do
    expect { @row.save }.to change { Row.count }.by(1)
  end

  it 'includes thumbs' do
    thumb1 = Thumb.create(label: 'Doctor Stranglove', row: @row)
    thumb2 = Thumb.create(label: 'Doctor Phil', row: @row)

    @row.thumbs.should include(thumb1)
    @row.thumbs.should include(thumb2)
    @row.should have(2).thumbs
  end

end
