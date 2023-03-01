module ApplicationHelper
  def to_currency(amount)
    number_to_currency(amount, locale: :ph)
  end

  def to_percent(val, pre)
    number_to_percentage(val, precision: pre)
  end

  def num_to_human(val)
    val.humanize.titleize
  end

  def badge_status_color(val)
    if val == true
      "success"
    else
      "secondary"
    end
  end

  def status_name(val)
    if val == true
      "APPROVED"
    else
      "PENDING"
    end
  end
end
