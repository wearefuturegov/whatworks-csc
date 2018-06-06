module ContentfulController
  extend ActiveSupport::Concern
  
  included do
    helper ContentfulRails::MarkdownHelper
    before_action :load_content, only: :show
  end
  
  private
  
  def load_content
    check_preview
    klass = controller_name.classify.constantize
    content = klass.find_by(slug: params[:id]).load.first
    instance_variable_set("@#{controller_name.singularize}", content)
  end
    
  def preview_enabled?
    params[:preview_token] == ENV['PREVIEW_TOKEN']
  end
  
  def check_preview
    ContentfulModel.use_preview_api = preview_enabled?
  end
end
