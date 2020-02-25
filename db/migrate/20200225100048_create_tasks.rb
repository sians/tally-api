class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :text
      t.boolean :completed
      t.references :panel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
