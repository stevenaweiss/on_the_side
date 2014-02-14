class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.text :name
      t.text :address
      t.text :photo_url
      t.references :ingredient 
    end
  end
end
