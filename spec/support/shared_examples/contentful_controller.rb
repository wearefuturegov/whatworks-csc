RSpec.shared_examples 'contenful controller #show' do |controller_name, class_name, slug|
  
  before do
    stub_api_response(slug, "#{controller_name}/show")
  end
  
  it 'returns the right content type' do
    get :show, params: { id: slug }
    expect(assigns(:"#{controller_name}")).to be_a(class_name)
  end
  
end
