require 'spec_helper'

feature 'user views rows' do

  background do
    Row.delete_all
    row1 = FactoryGirl.create(:row)
    thumb1 = FactoryGirl.create(:thumb, row: row1)
    thumb2 = FactoryGirl.create(:thumb, row: row1)
    thumb3 = FactoryGirl.create(:thumb, row: row1)
    thumb4 = FactoryGirl.create(:thumb, row: row1)
    thumb5 = FactoryGirl.create(:thumb, row: row1)
  end

  scenario 'by navigating to application root' do
    visit root_path
    expect(page).to have_content('Thumbs Up')
    expect(page).to have_selector('.thumb-row', count: 1)
    expect(page).to have_selector('.thumb', count: 5)
  end

end