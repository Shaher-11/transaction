module ExpensesHelper
  def display_expenses(name, expenses)
    render partial: name, locals: { obj: expenses } if expenses
  end

  def display_image(expense)
    return unless expense.groups.exists?

    "<div class='col-sm-2'> #{image_tag(expense.groups.first.image, class: 'group-img')}</div>".html_safe
  end
end
