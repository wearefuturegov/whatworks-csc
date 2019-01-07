class Comment < ApplicationRecord
  self.content_type_id = 'comment'
  
  has_one :associated_record, class_name: 'BlogPost'
    
  def self.create(params)
    return unless params[:website].blank?
    comment = super(params)
    CommentMailer.with(comment_id: comment.id).comment_alert.deliver_now
    comment
  end
  
  def contentful_url
    "https://app.contentful.com/spaces/#{ENV['CONTENTFUL_SPACE_ID']}/entries/#{id}"
  end
end
