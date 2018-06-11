step 'I should see an error relating to the email field' do
  expect(find('.email .error')).to_not be_nil
end
