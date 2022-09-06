class GetRoutePoints
  def initialize(points)
    @points = points
  end

  def call
    cycling_directions = Mapbox::Directions.directions(@points, "cycling", { geometries: "geojson", overview: "full", steps: true, annotations: "distance" } )
    console.log(cycling_directions)
    cycling_directions.first["routes"].first["geometry"]["coordinates"]
  end
end
