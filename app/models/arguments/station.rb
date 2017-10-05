# frozen_string_literal: true

module Arguments
  class Station
    include Virtus.model
    include ActiveModel::Validations

    DEFAULT_DISTANCE = 3000

    attribute :latitude,  Numeric
    attribute :longitude, Numeric
    attribute :distance,  Numeric, default: DEFAULT_DISTANCE

    validates :latitude,  presence: true,
                          numericality: true
    validates :longitude, presence: true,
                          numericality: true
    validates :distance,  numericality: true

    def initialize(params)
      super params.permit(*attribute_set.map(&:name))
    end
  end
end
