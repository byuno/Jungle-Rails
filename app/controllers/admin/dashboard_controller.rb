class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  
  # , except: [:index, :show]
  before_filter :authorize
  def index
    @articles = Article.all
  end

  def show
    @product = Product.count
    @category = Category.count
  end

end
