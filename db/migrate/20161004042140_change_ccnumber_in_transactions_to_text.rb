class ChangeCcnumberInTransactionsToText < ActiveRecord::Migration[5.0]
  def change
    change_column :transactions, :credit_card_number, :text
  end
end
