class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.references :category, null: false, index: true
      t.string :title, index: true, null: false
      t.string :summary
      t.string :photo

      t.timestamps null: false
    end
  end
end
