class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :title
      t.string :date
      t.string :link

      t.timestamps null: false
    end
  end
end
