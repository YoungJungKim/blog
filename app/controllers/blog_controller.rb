class BlogController < ApplicationController
	def post
		@posts = Post.all
	end
	
	def show
		@post = Post.find(params[:id])
	end

	def write
	end
	
	def write_complete
		p = Post.new
		p.title = params[:write_title]
		p.content = params[:write_content]
		if p.save
			flash[:alert] = "성공적으로 등록되었습니다."
			redirect_to "/blog/show/#{p.id}"
		else
			flash[:alert] = "제대로 입력해 주세요."
			redirect_to :back
		end
	end

	def edit
    @post = Post.find(params[:id])
	end
	
	def edit_complete
    p = Post.find(params[:id])
    p.title = params[:edit_title]
    p.content = params[:edit_content]
    if p.save
      flash[:alert] = "수정되었습니다."
      redirect_to "/blog/show/#{p.id}"
    else
      flash[:alert] = "제대로 입력해 주세요."
      redirect_to :back
    end
	end

	def delete_complete
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "삭제되었습니다."
    redirect_to "/"
	end
end
