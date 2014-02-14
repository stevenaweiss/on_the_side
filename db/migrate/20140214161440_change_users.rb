class ChangeUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.text(:last_name)
    end
  end
end
