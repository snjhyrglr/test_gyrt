module ApplicationHelper
  def to_currency(amount)
    number_to_currency(amount, locale: :ph)
  end

  def to_percent(val, pre)
    number_to_percentage(val, precision: pre)
  end
end
