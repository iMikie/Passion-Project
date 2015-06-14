class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :username, limit: 50
      t.string   :email, limit: 50
      t.string   :password_hash, limit: 50
      t.string   :phone_number, limit: 24

      t.timestamps
    end
  end
end
