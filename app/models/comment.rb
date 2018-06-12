class Comment < ApplicationRecord
  self.content_type_id = 'comment'
  
  has_one :associated_record, class_name: 'BlogPost'
      
  def send_email
    CommentMailer.with(comment_id: id).comment_alert.deliver_now
  end
end
