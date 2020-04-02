class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  
  # , except: [:index, :show]
 
  def index
    @articles = Article.all
  end
  def show
  end
end
