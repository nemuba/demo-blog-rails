module LikesHelper
  def liked?(post_id)
    Like.exists?(post_id: post_id, user_id: current_user.id)
  end

  def like_id(post_id)
    like = Like.find_by(post_id: post_id, user_id: current_user.id)
    like.id
  end
end