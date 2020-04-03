class AddTimestamps < ActiveRecord::Migration[5.1]
  def change
    change_table :rides do |t|
      t.timestamps
    end

    change_table :mechanic_rides do |t|
      t.timestamps
    end
  end
end
