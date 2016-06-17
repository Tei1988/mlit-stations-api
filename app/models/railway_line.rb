class RailwayLine < ActiveRecord::Base
  has_many :stations
  belongs_to :company
  belongs_to :railway_type
end
