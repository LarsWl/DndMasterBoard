class UserDecorator < Draper::Decorator
  delegate_all

  def friendship_request_title(friend)
    if friends.pluck(:id).include?(friend.id)
      'Заявка отправлена'
    else
      'Отправить заявку'
    end
  end

  def friendship_requests_turbo_stream_name
    "user:#{id}:friendship_requests"
  end

  def dom_id_as_friend
    "friend_#{id}"
  end
end
