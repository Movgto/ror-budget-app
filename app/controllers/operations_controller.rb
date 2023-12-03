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
    operation = Operation.new(params.require(:operation).permit(:name, :amount, :categories))
    operation.user_id = current_user.id

    if operation.save
      params[:operation][:categories].each do |cat|
        next if cat.empty?
        category_operation = CategoryOperation.new(category_id: cat, operation_id: operation.id)
        category_operation.save
      end
      flash[:notice] = 'Operation added successfully'
    else
      flash[:alert] = 'Operation could not be added'
    end
    redirect_to category_operations_path(@category)
  end
end
