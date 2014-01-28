require 'spec_helper'

feature 'user views rows' do

  scenario 'by navigating to application root' do
    visit root_path
    expect(page).to have_content('Thumbs Up')
  end

end