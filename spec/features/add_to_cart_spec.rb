require 'rails_helper'

RSpec.feature "Visitor adds to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(name: "Chair",
    description: "It's wooden",
    image: open_asset('apparel1.jpg'),
    quantity: 100000,
    price: 9.99)

  end

  scenario "They see cart amount go up by 1" do
    visit root_path
    click_button 'Add'



    # commented out b/c it's for debugging only
    save_and_open_screenshot

    expect(page).to have_content("(1)")
    puts page.html
  end
end