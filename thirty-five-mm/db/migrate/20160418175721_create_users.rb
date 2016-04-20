class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :trusted, default: false
      t.string :username
      t.string :pic_url
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
