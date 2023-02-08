class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :name
      t.integer :group_size
      t.datetime :reservation_date
      t.integer :status
      t.text :comments

      t.timestamps
    end
  end
end
