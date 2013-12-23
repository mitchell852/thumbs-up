require 'spec_helper'

feature 'user views a row' do
  row = Row.create
  Thumb.create(label: 'Thumb 1', row_id: row.id)
  Thumb.create(label: 'Thumb 2', row_id: row.id)

  scenario 'by visiting the row path' do
    visit row_path(row)
    expect(page).to have_content("Row ##{row.id} thumbs")
    expect(page).to have_selector('div.thumb')
  end
end

feature 'user creates a new row' do
  Row.create # just so we have at least one row to show

  scenario 'by clicking create new row' do
    visit rows_path
    expect(page).to have_content('Rows')
    expect(page).to have_selector('div.row')
    expect { click_button 'Create new row' }.to change { Row.count }.by(1)
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