class AddDefaultCreatedAtToCities < ActiveRecord::Migration[7.1]
  def change
    change_column_default :cities, :created_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
