class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :customer_id, null: false
      t.integer :admin_id, null: false
      t.date :date, null: false
      t.integer :item_id, null: false
      t.time :time, null: false
      t.integer :people, null: false

      t.timestamps
    end
  end
end
