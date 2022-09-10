class ChangeDataTypeForCpf < ActiveRecord::Migration[6.1]
  def self.up
    change_table :contacts do |t|
      t.change :cpf, :string
    end
  end
  def self.down
    change_table :contacts do |t|
      t.change :cpf, :bigint
    end
  end
end
