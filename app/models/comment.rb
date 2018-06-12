class Comment < ApplicationRecord
  self.content_type_id = 'comment'
  
  has_one :associated_record, class_name: 'BlogPost'
  
  def self.create(params)
    comment = super(params)
    CommentMailer.with(comment_id: comment.id).comment_alert.deliver_now
    comment
  end
      
  def send_email
    CommentMailer.with(comment_id: id).comment_alert.deliver_now
  end
end
