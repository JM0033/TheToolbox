class GetRoutePoints
  def initialize(points)
    @points = points
  end

  def call
    cycling_directions = Mapbox::Directions.directions(@points, "cycling", { geometries: "geojson", overview: "full" } )
    puts "\n\n\n -------------"
    puts cycling_directions
    puts "\n\n\n --------------"
    {
      points: cycling_directions.first["routes"].first["geometry"]["coordinates"],
      duration: cycling_directions.first["routes"].first["duration"],
      distance: cycling_directions.first["routes"].first["distance"]
    }
  end
end
