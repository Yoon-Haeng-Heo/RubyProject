class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show,:edit,:destroy]
  before_action :set_post, only: [:show,:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    3.times { @post.hashtags.new }
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    3.times do |x|
      tag = hashtag_params[:hashtags_attributes]["#{x}"][:title]
      addHashtag = Hashtag.find_or_create_by(title: tag)

      @post.hashtags << addHashtag
    end
    respond_to do |format|
      if @post.save
        format.html{ redirect_to root_path, notice: '게시물이 성공적으로 작성되었습니다!'}
      else
        format.html{ render :new }
      end
    end
    # params[:hashtags_attributes][0 or 1 or 2 여기는 번호가 들어감][:title] => 이렇게 뽑아야 나옴
    # "hashtags_attributes"=>
    # { "0"=>{"title"=>"하나"}, "1"=>{"title"=>"둘"}, "2"=>{"title"=>"셋"} }
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
  
  def hashtag_params
    params.require(:post).permit(hashtags_attributes: [:title])
  end

end
