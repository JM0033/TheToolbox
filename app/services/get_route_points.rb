class GetRoutePoints
  def initialize(points)
    @points = points
  end

  def call
    cycling_directions = Mapbox::Directions.directions(@points, "cycling", { geometries: "geojson", overview: "full" } )
    cycling_directions.first["routes"].first["geometry"]["coordinates"]
  end
end
