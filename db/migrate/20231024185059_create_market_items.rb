class CreateMarketItems < ActiveRecord::Migration[7.0]
  def change
    create_table :market_items do |t|
      t.string :name
      t.date :date
      t.references :market_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
