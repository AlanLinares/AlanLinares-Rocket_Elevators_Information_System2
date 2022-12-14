class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :admin_full_name
      t.string :admin_email
      t.string :admin_phone
      t.string :tech_contact_full_name
      t.string :tech_contact_email
      t.string :tech_contact_phone

      t.timestamps
    end
  end
end
