class Post < ActiveRecord::Base
	has_many	:comments
	validates :title , :presence => { :message => "제목을 입력해 주세요." }
	validates :content , :presence => { :message => "내용을 입력해 주세요." }
end
