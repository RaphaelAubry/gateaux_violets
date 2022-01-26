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

  def active_basket_items
    count = 0
    basket = Basket.last
    if basket.payment_type.nil?
      basket.lines.each do |line|
        count += line.quantity
      end
    end
    return count
  end

end
