class ExpensesController < ApplicationController
  before_action :require_user

  def index
    return if current_user.expenses.size.zero?

    @expenses = current_user.expenses.desc.select { |expense| expense.groups.exists? }
  end

  def external
    return if current_user.expenses.size.zero?

    @expenses = current_user.expenses.desc.reject { |expense| expense.groups.exists? }
  end

  def new
    @expense = Expense.new
    @groups = current_user.groups
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    @group = Group.find_by(id: group_params[:group_id])
    @expense.groups << @group unless @group.nil?

    if @expense.save
      flash[:success] = 'Expense has beeb created successfully!'
      redirect_to expenses_path
    else
      flash.now[:error] = @expense.errors.full_messages
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def group_params
    params.require(:expense).permit(:group_id)
  end
end
