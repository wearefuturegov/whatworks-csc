# frozen_string_literal: true

class ApplicationRecord < ContentfulModel::Base
  include Draper::Decoratable
  
  def self.preview
    ContentfulModel.use_preview_api = true
    self
  end
end
