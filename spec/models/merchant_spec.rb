require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many(:invoices) }

  it { should have_many(:items) }

  it "can calculate its own revenue" do
    merchant       = create(:merchant)
    invoice_1      = create(:invoice, merchant: merchant)
    invoice_2      = create(:invoice, merchant: merchant)
    failed_invoice = create(:invoice, merchant: merchant)

    invoice_item_1 = create(:invoice_item, invoice: invoice_1, quantity: 1, unit_price: 100.75)
    invoice_item_2 = create(:invoice_item, invoice: invoice_1, quantity: 1, unit_price: 150.50)

    invoice_item_3 = create(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 20.00)
    invoice_item_4 = create(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 30.00)

    invoice_item_5 = create(:invoice_item, invoice: failed_invoice, quantity: 1, unit_price: 500.99)

    create(:transaction, invoice: invoice_1, result: "failed")
    create(:transaction, invoice: invoice_1, result: "success")

    create(:transaction, invoice: invoice_2, result: "success")
    
    create(:transaction, invoice: failed_invoice, result: "failed")

    expect(merchant.revenue).to eq(351.25)
  end
end
