class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postcode,            null: false
      t.integer     :region_delivery_id,  null: false
      t.string      :city,                null: false
      t.string      :street_address,      null: false
      t.string      :building_name
      t.string      :phone_number,        null: false
      t.references  :buy_log,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
