class RemoveDateFromMarketItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :market_items, :date, :date
  end
end
