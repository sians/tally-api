class AddStatusToPanel < ActiveRecord::Migration[6.0]
  def change
    add_column :panels, :status, :integer, default: 0
  end
end
