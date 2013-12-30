require 'spec_helper'

feature 'user views a row' do
  row = Row.create(title: 'Row title')
  Thumb.create(label: 'Thumb 1', row_id: row.id)
  Thumb.create(label: 'Thumb 2', row_id: row.id)

  scenario 'by visiting the row path' do
    visit row_path(row)
    expect(page).to have_content("Row ##{row.id} thumbs")
    expect(page).to have_selector('div.thumb')
  end
end

feature 'user creates a new row' do
  create_row = 'Create new row'

  background do
    visit rows_path
    expect(page).to have_link(create_row)
    click_link create_row
    expect(page).to have_content('New row')
  end

  scenario 'with invalid info' do
    expect { click_button 'Create Row' }.to_not change { Row.count }.by(1)
  end

  scenario 'with valid info' do
    fill_in 'Title', with: 'Row title'
    fill_in 'Description', with: 'Row description'
    fill_in 'Link url', with: 'http://www.foo.com/good-stuff'
    expect { click_button 'Create Row' }.to change { Row.count }.by(1)
    expect(page).to have_content('Row title')
  end
end

feature 'user deletes a row' do
  Row.create # just so we have at least one row to show

  scenario 'by clicking the delete link' do
    visit rows_path
    expect(page).to have_content('Rows')
    expect(page).to have_selector('div.row')
    expect { first('.row').click_link('Delete').to change { Row.count }.by(-1) }
  end
end