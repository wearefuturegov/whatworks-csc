class CommentMailer < ApplicationMailer
  
  def comment_alert
    @comment = Comment.preview.find_by(id: params[:comment_id]).load.first
    mail(to: ENV['CSC_CONTACT_EMAIL'], subject: "New blog post comment on '#{@comment.associated_record.title}'")
  end
  
end
