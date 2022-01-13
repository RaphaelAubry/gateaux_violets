module ApplicationHelper

  include ActionView::Helpers::NumberHelper

  CURRENCY = "EUR"

  def TimeFr(date)
    return date.strftime("%d/%m/%Y à %H:%M")
  end

  def d2(number)
    number_with_precision(number, precision: 2)
  end

  def personnes
    " personnes"
  end

  def currency
    " EUR"
  end

end
