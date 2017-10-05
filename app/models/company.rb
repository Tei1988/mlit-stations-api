# frozen_string_literal: true

class Company < ActiveRecord::Base
  has_many :railway_lines
  belongs_to :service_provider_type
end
