class ChangeIngredients < ActiveRecord::Migration
  def change
    change_table(:ingredients) do |t|
      t.text(:description)
    end
  end
end
