class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :query

      t.timestamps null: false
    end
  end
end
