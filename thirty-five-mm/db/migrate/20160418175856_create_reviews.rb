class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :film, index: true, null: false
      t.references :user, index: true, null: false
      t.boolean :flag, default: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
