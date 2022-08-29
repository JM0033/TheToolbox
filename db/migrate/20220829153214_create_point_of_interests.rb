class CreatePointOfInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :point_of_interests do |t|
      t.string :address
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
