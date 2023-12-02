class OperationsController < ApplicationController
  before_action :authenticate_user!
  layout 'shared'

  def index
    @category = Category.find(params[:category_id])
    @operations = @category.operations
  end

  def new
    @operation = Operation.new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    operation = Operation.new(params.require(:operation).permit(:name, :amount))
    operation.user_id = current_user.id

    category_operation = CategoryOperation.new(category: @category, operation:)

    if operation.save && category_operation.save
      flash[:notice] = 'Operation added successfully'
    else
      flash[:alert] = 'Operation could not be added'
    end
    redirect_to category_operations_path(@category)
  end
end
