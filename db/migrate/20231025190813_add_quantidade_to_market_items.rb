class AddQuantidadeToMarketItems < ActiveRecord::Migration[7.0]
  def change
    add_column :market_items, :quantidade, :integer
  end
end
