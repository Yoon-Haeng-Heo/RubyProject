class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.post_id = params[:post_id]
    comment.user_id = current_user.id  ## 현재 유저 정보를 가져오는 것
    comment.save

    redirect_back fallback_location: root_path
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_back fallback_location: root_path
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
