class AddDefaultUpdatedAtToUsersAndCities < ActiveRecord::Migration[7.1]
  def change
    change_column_default :cities, :updated_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :users, :updated_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :private_messages, :updated_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :tags, :updated_at, -> { 'CURRENT_TIMESTAMP' }
  end

end
