module ApplicationHelper

  def css_class_btn(action_name)
    action_name == 'new' ? 'is-primary' : 'is-success'
  end
end
