module ApplicationHelper

  include ActionView::Helpers::NumberHelper

  def d2(number)
    number_with_precision(number, precision: 2)
  end

  def personnes
    " personnes"
  end
end
