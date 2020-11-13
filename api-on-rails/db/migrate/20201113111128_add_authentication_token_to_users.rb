class AddAuthenticationTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :auth_token, :string, limit: 30
    add_index :users, :auth_token, unique: true
  end
end
