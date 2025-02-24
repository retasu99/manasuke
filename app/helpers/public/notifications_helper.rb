module Public::NotificationsHelper

  def transition_path(notification)
    
    case notification.action_type.to_sym
    when :acknowledged_to_own_post
      project_post_work_path(notification.subject.post_work.project.id, notification.subject.post_work.id)
    end

  end

end
