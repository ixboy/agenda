class ChangeIntegerLimitInContacts < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :cpf, :integer, limit: 8
  end
end
