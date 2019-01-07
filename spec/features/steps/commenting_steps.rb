module CommentingSteps
  
  step 'I want to comment on an article' do
    @comment = {
      name: 'Batman',
      email: 'foo@example.com',
      organisation: 'Some Org',
      comment: 'Comment goes here'
    }
  end
  
  step 'I don\'t enter my email' do
    @comment[:name] = 'Batman Blank Email'
    @comment[:email] = nil
  end
  
  step 'I leave a comment' do
    fill_in I18n.t('simple_form.labels.comment.name'), with: @comment[:name]
    fill_in I18n.t('simple_form.labels.comment.email'), with: @comment[:email]
    fill_in I18n.t('simple_form.labels.comment.organisation'), with: @comment[:organisation]
    fill_in I18n.t('simple_form.labels.comment.comment'), with: @comment[:comment]
    
    click_on I18n.t('simple_form.labels.comment.create')
  end
  
  step 'the comment should not be stored' do
    expect(Comment.preview.find_by(name: @comment[:name]).load.count).to eq(0)
  end
  
  step 'I should see an error message' do
    expect(page.body).to match(/Some required fields were missing/)
  end
  
  step 'the comment should be stored as a draft' do
    comment = Comment.preview.find_by(name: @comment[:name]).load.last
    expect(comment.name).to eq(@comment[:name])
    expect(comment.email).to eq(@comment[:email])
    expect(comment.organisation).to eq(@comment[:organisation])
    expect(comment.comment).to eq(@comment[:comment])
    expect(comment.associated_record.slug).to eq(BlogPost.find_by(slug: @slug).load.last.slug)
  end
  
  step 'the comment is approved' do
    comment = Comment.preview.all.load.last
    comment.publish
    Rails.cache.clear
  end
  
  step 'my comment should show underneath the blog post' do
    visit blog_post_path(@slug)
    expect(page.body).to match(/#{@comment[:comment]}/)
  end
  
  step 'I add something to the website field' do
    fill_in 'comment_website', with: 'Some text', visible: false
  end
  
end

RSpec.configure do |config|
  config.include CommentingSteps
end
