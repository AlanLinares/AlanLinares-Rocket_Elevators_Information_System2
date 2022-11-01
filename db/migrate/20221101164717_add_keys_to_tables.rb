class AddKeysToTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :buildings, foreign_key: true, first: true
    add_reference :columns, :batteries, foreign_key: true, first: true
    add_reference :batteries, :employees, foreign_key: true, first: true
    add_reference :buildings, :address,  foreign_key: true, first: true
  end
end

