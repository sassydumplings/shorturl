class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :full, null: false
      t.string :short, null: false

      t.timestamps null: false
    end
  end
end
