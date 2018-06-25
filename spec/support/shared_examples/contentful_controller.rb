RSpec.shared_examples 'contenful controller #show' do |controller_name, class_name, slug|
  
  before do
    stub_api_response("#{controller_name}/show", 'fields.slug' => slug)
  end
  
  it 'returns the right content type' do
    get :show, params: { id: slug }
    expect(assigns(:"#{controller_name}")).to be_a(class_name)
  end
  
  it 'returns a 404' do
    expect { get :show, params: { id: 'i-dont-exist' } }.to raise_error(ActionController::RoutingError)
  end
  
end

RSpec.shared_examples 'contenful controller #index' do |controller_name, class_name|
  
  before do
    stub_api_response("#{controller_name}/index")
  end
  
  it 'returns the right content type' do
    get :index
    expect(assigns(:"#{controller_name.pluralize}").first).to be_a(class_name)
  end
  
end
