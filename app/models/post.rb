class Post < ApplicationRecord
    has_many :comments  #comment를 여러개 가진다는 뜻
end
