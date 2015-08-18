class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :auth_token
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
