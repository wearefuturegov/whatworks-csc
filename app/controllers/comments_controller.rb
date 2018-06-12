class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params.to_h.symbolize_keys)
    @comment.save
  end
  
  private
  
  def comment_params
    params.require(:comment)
          .permit(:name, :email, :organisation, :comment)
          .merge(associated_record: blog_post)
  end
  
  def blog_post
    BlogPost.find_by(slug: params[:blog_post_id]).load.first
  end
  
end
