module EmailSteps
  step 'I want to contact the centre' do
    @form = ContactForm.new(
      name: FFaker::Name.name,
      email: FFaker::Internet.email,
      message: FFaker::Lorem.paragraph
    )
    visit('/contact-us')
  end
  
  step 'I miss the email field' do
    @form.email = nil
  end
  
  step 'I submit a contact form' do
    fill_in I18n.t('simple_form.labels.contact_form.name'), with: @form.name
    fill_in I18n.t('simple_form.labels.contact_form.email'), with: @form.email
    fill_in I18n.t('simple_form.labels.contact_form.message'), with: @form.message
    click_on I18n.t('helpers.submit.contact_form.create')
  end

  step 'the contact email address should recieve an email with the correct content' do
    emails = unread_emails_for(ENV['CSC_CONTACT_EMAIL'])
    expect(emails.count).to eq(1)
    expect(emails.first.body).to match(/#{@form.name}/)
    expect(emails.first.body).to match(/#{@form.message}/)
  end
  
  step 'the contact email address should recieve a comment alert' do
    emails = unread_emails_for(ENV['CSC_CONTACT_EMAIL'])
    blog_post = BlogPost.find_by(slug: @slug).load.first
    expect(emails.count).to eq(1)
    expect(emails.first.subject).to match(/#{blog_post.title}/)
    expect(emails.first.body.raw_source).to match(/#{@comment[:name]}/)
    expect(emails.first.body.raw_source).to match(/#{@comment[:email]}/)
    expect(emails.first.body.raw_source).to match(/#{@comment[:organisation]}/)
    expect(emails.first.body.raw_source).to match(/#{@comment[:comment]}/)
  end
  
  step 'the contact email address should not recieve an email' do
    emails = unread_emails_for(ENV['CSC_CONTACT_EMAIL'])
    expect(emails.count).to eq(0)
  end
end

RSpec.configure do |config|
  config.include EmailSteps
end
