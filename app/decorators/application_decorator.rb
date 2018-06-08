class ApplicationDecorator < Draper::Decorator
  # Define methods for all decorated objects.
  # Helpers are accessed through `helpers` (aka `h`). For example:
  #
  #   def percent_amount
  #     h.number_to_percentage object.amount, precision: 2
  #   end
  
  def standard_wrapper(label, value)
    return nil if value.blank?
    h.content_tag(:p, '') do
      h.content_tag(:strong, "#{label}: ", class: 'label') <<
        value
    end
  end
end
