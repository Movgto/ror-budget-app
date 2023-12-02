class CategoriesController < ApplicationController
  before_action :authenticate_user!
  layout 'shared'

  def index
    @categories = Category.includes(:user).where(user: current_user).references(:user)
    @total = @categories.reduce(0) { |sum, elem| sum + elem.total }
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(params.require(:category).permit(:name))
    category.user_id = current_user.id
    puts 'Category is valid:', category.valid?
    puts 'User: ', category.user
    category.errors.messages.each do |msg|
      puts msg
    end

    if category.save
      flash.now[:notice] = 'Category has been added successfully'
    else
      flash.now[:alert] = 'An error ocurred while creating a new category, please try again'
    end
    redirect_to categories_path
  end
end
