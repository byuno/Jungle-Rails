require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject{
      @category = Category.new(:name => "Funiture"),
      @product = Product.new(:name => "Chair", :price => 20, :quantity => 2, :category => @category)
    }

    it "is valid with valid attributes" do
      
      expect(subject).to be_valid
    end

    it "is not valid without a name"
    it "is not valid without a price"
    it "is not valid without a quantity"
    it "is not valid without a category"
  end
end
