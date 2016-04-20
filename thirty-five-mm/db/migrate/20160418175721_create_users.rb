class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :trusted, default: false
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :pic_url
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
