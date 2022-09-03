class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.integer :cpf
      t.string :email
      t.date :birth_date

      t.timestamps
    end
    add_index :contacts, :cpf, unique: true
    add_index :contacts, :email, unique: true
  end
end
