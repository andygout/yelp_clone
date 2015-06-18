require 'rails_helper'
require_relative '../helpers/session_helpers'
include Session

feature 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
    sign_up('test@test.com', 'testpassword')
    click_link 'Endorse'
    expect(page).to have_content('1 endorsement')
  end

end