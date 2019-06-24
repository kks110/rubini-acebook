module ApplicationHelper
  def active_class(controller_name, action_name)
   "active" if current_page?(controller: controller_name, action: action_name)
  end
end
