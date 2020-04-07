require 'rails_helper'

RSpec.feature "Visitor navigates to prodcut details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
    @category.products.create!(name: "Chair",
                               description: "It's wooden",
                               image: open_asset('apparel1.jpg'),
                               quantity: 1,
                               price: 9.99)
  end

  scenario "They see all products" do
    visit root_path
    # find("img[alt='Kogi hashtag bicycle rights everyday chillwave.']").click
    # commented out b/c it's for debugging only
    click_link('Chair')
    save_and_open_screenshot
    #  find('Ugh brunch aesthetic pug pinterest intelligentsia waistcoat small batch').click

    expect(page).to have_content("Chair")
    save_and_open_screenshot

  
    puts page.html
  end
end