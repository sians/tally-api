class CreateColourThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :colour_themes do |t|
      t.string :dark
      t.string :light
      t.string :highlight

      t.timestamps
    end
  end
end
