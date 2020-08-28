class Post < ApplicationRecord
    has_many :comments  #comment를 여러개 가진다는 뜻
    
    has_and_belongs_to_many :hashtags
    accepts_nested_attributes_for :hashtags
end
