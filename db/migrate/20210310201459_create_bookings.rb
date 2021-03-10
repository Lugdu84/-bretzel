class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_start
      t.datetime :booking_end
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true

      t.timestamps
    end
  end
end
