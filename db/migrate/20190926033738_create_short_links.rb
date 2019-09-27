class CreateShortLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :short_links do |t|
      t.string :original_url
      t.string :short_url

      t.timestamps
    end
  end
end
