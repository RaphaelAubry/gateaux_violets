module ApplicationHelper
  def TimeFr(date)
    return date.strftime("%d/%m/%Y à %H:%M")
  end
end
