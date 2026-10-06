class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :location
      t.date :date_lost_found
      t.string :status

      t.timestamps
    end
  end
end
