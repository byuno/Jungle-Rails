class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def index
    @categories = Category.order(created_at: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

end

def product_params
  params.require(:category).permit(
    :name,
    :created_at,
    :updated_at
  )
end