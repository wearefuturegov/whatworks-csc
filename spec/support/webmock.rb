def stub_api_response(filename, params = {})
  path = Rails.root.join('spec', 'fixtures', 'stubs', "#{filename}.json")
  json = File.read path
  stub_request(:get, %r{https:\/\/cdn.contentful.com})
    .with(query: hash_including(params))
    .to_return(body: json)
end
