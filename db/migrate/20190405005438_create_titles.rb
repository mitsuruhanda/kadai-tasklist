class CreateTitles < ActiveRecord::Migration[5.0]
  def change
    create_table :titles do |t|
      t.string :name
      t.date :sale_data

      t.timestamps
    end
  end
end
