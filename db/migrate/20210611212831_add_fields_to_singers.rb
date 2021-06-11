class AddFieldsToSingers < ActiveRecord::Migration[6.1]
  def change
    add_column :singers, :pronoun, :string
    add_column :singers, :active, :boolean
  end
end
