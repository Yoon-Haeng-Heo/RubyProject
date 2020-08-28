class Post < ApplicationRecord
    has_many :comments  #comment를 여러개 가진다는 뜻
    
    has_and_belongs_to_many :hashtags
    accepts_nested_attributes_for :hashtags

    #mount_uploader :image_url, ImageUploader # post 모델의 image_url 칼럼에 내가 올린 파일의 주소를 저장해줘!
end 
