require 'spec_helper'

describe Row do
  it { should respond_to(:thumbs) }

  it 'includes thumbs' do
    thumb1 = Thumb.new(label: 'Doctor Stranglove')
    thumb2 = Thumb.new(label: 'Doctor Phil')
    row = Row.new(thumbs: [thumb1, thumb2])
    row.thumbs.should include(thumb1)
    row.thumbs.should include(thumb2)
  end
end
