class ChangeRestaurantUrl < ActiveRecord::Migration
  def change
    change_table(:restaurants) do |t|
      t.rename :photo_url, :url
    end
  end
end
