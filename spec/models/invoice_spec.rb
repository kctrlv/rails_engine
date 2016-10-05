require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should belong_to(:customer) }

  it { should belong_to(:merchant) }

  it "should calculate its own total revenue" do
    invoice = create(:invoice)
    ii_1 = create(:invoice_item, invoice: invoice, quantity: 10, unit_price: 10.00)
    ii_2 = create(:invoice_item, invoice: invoice, quantity: 2, unit_price: 50.00)

    expect(invoice.total).to eq(200.00)
  end
end
