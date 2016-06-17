class Station < ActiveRecord::Base
  belongs_to :railway_line

  scope :close_to, -> (latitude, longitude, distance_in) {
    where(%{
      ST_DWithin(
        location,
        ST_GeographyFromText(
          'SRID=6668;POINT(%f %f)'
        ), %f
      )
    } % [latitude, longitude, distance_in])
  }
end
