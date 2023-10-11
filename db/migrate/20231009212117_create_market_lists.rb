class CreateMarketLists < ActiveRecord::Migration[7.0]
  def change
    create_table :market_lists do |t|
      t.string :name
      t.date :market_date, null: false
      t.timestamps
    end
  end
end
