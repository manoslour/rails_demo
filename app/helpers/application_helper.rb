module ApplicationHelper
  def formatted_date(date: Date.today, something:)
    [date.strftime("%B"), something]
  end

  # formatted_date something: "else"
  # formatted_date(something: "else")
end
