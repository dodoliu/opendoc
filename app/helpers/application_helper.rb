module ApplicationHelper

  def status_menu
    {active: :启用, archived: :归档}
  end
  def find_status(status)
    status_menu.each{ |item|  return item[1] if item[0].to_s.eql?(status) }
  end

end
