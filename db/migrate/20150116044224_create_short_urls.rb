class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :full, null: false, unique: true, index: true
      t.string :short, null: false, unique: true, index: true

      t.timestamps null: false
    end
  end
end
