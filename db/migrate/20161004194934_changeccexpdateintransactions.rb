class Changeccexpdateintransactions < ActiveRecord::Migration[5.0]
  def change
    change_column :transactions, :credit_card_expiration_date, :text
  end
end
