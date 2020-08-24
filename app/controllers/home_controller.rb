class HomeController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html{ redirect_to root_path, notice: '게시물이 성공적으로 작성되었습니다!'}
      else
        format.html{ render :new }
      end
    end
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def edit
    # @post = Post.find(params[:id])  // set post를 통해서 해결
  end

  def update    
    # post = Post.find(params[:id]) //원래는 @가 안들어가있는데 set post로 인해서 @삽입 필수 
    respond_to do |format|
      if @post.update(post_params)
        format.html{ redirect_to root_path, notice: '게시물이 성공적으로 수정되었습니다' }
      else
        format.html{ render :edit } 
      end
    end

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # title이랑 content만 받아와라 라는 뜻
  def post_params
    params.require(:post).permit(:title, :content)
  end
  

end
