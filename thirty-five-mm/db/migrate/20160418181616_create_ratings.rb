class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars

      t.references :ratable, null: false, polymorphic: true, index: true
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end

