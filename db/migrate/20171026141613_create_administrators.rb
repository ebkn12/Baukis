class CreateAdministrators < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :hashed_password
      t.boolean :suspended, default: false, null: false
      t.timestamps null: false
    end

    add_index :administrators, :email_for_index, unique: true
  end
end
