class CommentsController < ApplicationController
  before_action :set_comment ,only: [:edit,:destroy,:update]
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id  ## 현재 유저 정보를 가져오는 것
    @comment.save

    redirect_back fallback_location: root_path
  end

  def destroy
    # @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_back fallback_location: root_path
  end

  def edit
   #  @comment = Comment.find(params[:id])
    
  end

  def update    
    # post = Post.find(params[:id]) //원래는 @가 안들어가있는데 set post로 인해서 @삽입 필수 
    respond_to do |format|
      if @comment.update(comment_params)
        format.html{ redirect_to post_path(@comment.post_id), notice: '댓글이 성공적으로 수정되었습니다' }
      else
        format.html{ render :edit } 
      end
    end
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
