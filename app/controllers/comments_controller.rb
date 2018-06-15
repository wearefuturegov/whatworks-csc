class CommentsController < ApplicationController
  helper ContentfulRails::MarkdownHelper

  def create
    # We can't do normal Rails-y validation here because Contentful has to send
    # content to the server first, and also allows us to save drafts with missing
    # fields.
    if comment_params[:name].blank? || comment_params[:email].blank?
      flash[:notice] = 'Some required fields were missing'
      @blog_post = @blog_post.decorate
      render 'blog_posts/show'
    else
      @comment = Comment.create(comment_params.to_h.symbolize_keys)
      redirect_to blog_post_path(params[:blog_post_id]), notice: 'Your comment has been submitted!'
    end
  end
  
  def publish
    comment = Comment.preview.find_by(id: params[:id]).load.first
    comment.publish
    redirect_to "/blog/#{comment.associated_record.slug}", notice: 'Comment Published!'
  end
  
  private
  
  def comment_params
    params.require(:comment)
          .permit(:name, :email, :organisation, :comment)
          .merge(associated_record: blog_post)
  end
  
  def blog_post
    @blog_post ||= BlogPost.find_by(slug: params[:blog_post_id]).load.first
  end
  
end
