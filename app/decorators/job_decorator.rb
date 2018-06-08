class JobDecorator < PersonDecorator
  delegate_all
  
  def decorate_salary
    standard_wrapper('Salary', object.salary)
  end
  
  def decorate_terms
    standard_wrapper('Terms', object.terms)
  end
  
  def decorate_closing_date
    standard_wrapper('Closing Date', object.closing_date.to_date.to_s(:short))
  end
end
