class AddContactToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :contact_name, :string
    add_column :items, :contact_email, :string
  end
end
