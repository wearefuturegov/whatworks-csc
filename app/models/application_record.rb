# frozen_string_literal: true

class ApplicationRecord < ContentfulModel::Base
  include Draper::Decoratable
end
