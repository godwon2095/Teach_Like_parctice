class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def like_toggle
        post = Post.find(params[:post_id])
        like = Like.find_by(user_id: current_user.id, post_id: post.id)
        
        if like.nil?
            Like.create(user_id: current_user.id, post_id: post.id)
        else
            like.destroy
        end
        
        redirect_to :back
    end
end
