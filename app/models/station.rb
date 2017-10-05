# frozen_string_literal: true

class Station < ActiveRecord::Base
  belongs_to :railway_line

  POSTGIS_CLOSE_TO = %{
    ST_DWithin(
      location,
      ST_GeographyFromText(
        'SRID=6668;POINT(%f %f)'
      ), %f
    )
  }

  scope :close_to, lambda { |latitude, longitude, distance_in|
    where(format(POSTGIS_CLOSE_TO, latitude, longitude, distance_in))
  }
end
