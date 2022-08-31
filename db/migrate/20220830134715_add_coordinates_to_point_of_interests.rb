class AddCoordinatesToPointOfInterests < ActiveRecord::Migration[7.0]
  def change
    add_column :point_of_interests, :latitude, :float
    add_column :point_of_interests, :longitude, :float
  end
end
