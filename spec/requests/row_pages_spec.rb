require 'spec_helper'

describe 'for the row pages' do
  subject { page }

  context 'on the all rows page' do
    let(:submit) { 'Create new row' }
    let(:delete) { 'Delete' }
    before do
      Row.create
      visit rows_path
    end

    it { should have_content('Rows') }
    it { should have_selector('div.row') }

    describe 'when the new row button is clicked' do
      specify { expect { click_button submit }.to change { Row.count }.by(1) }
    end

    describe 'when a row is deleted' do
      specify { expect { click_link delete }.to change { Row.count}.by(-1) }
    end
  end

  context 'on the show row page' do
    before do
      row = Row.create
      Thumb.create(label: 'Thumb 1', row_id: row.id)
      Thumb.create(label: 'Thumb 2', row_id: row.id)
      visit row_path(row)
    end

    it { should have_content('Row info') }
    it { should have_selector('div.thumb') }
  end

end
