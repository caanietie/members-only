class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.text :message, null: false, unique: true

      t.timestamps
    end
  end
end