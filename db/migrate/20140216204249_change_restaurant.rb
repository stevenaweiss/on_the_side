class ChangeRestaurant < ActiveRecord::Migration
  def change
    change_table(:restaurants) do |t|
      t.references :user
    end
  end
end
