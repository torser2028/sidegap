module ApplicationHelper
  def ldate(date, opts = {})
    date ? l(date, opts) : nil
  end
end
