class CreateAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.references :user, foreign_key: true, index: true
      t.references :event, foreign_key: true, index: true

      t.timestamps
    end
  end
end
