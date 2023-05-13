class AddRememberDigestToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :remember_digest, :string
    remove_column :users, :remember_token, :string
  end
end
