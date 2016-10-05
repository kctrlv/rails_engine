require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should belong_to(:customer) }

  it { should belong_to(:merchant) }

  it { should have_many(:transactions) }

  it { should have_many(:invoice_items) }

  xit "should calculate its own total revenue" do
    invoice = create(:invoice)
              create(:invoice_item, invoice: invoice, quantity: 10, unit_price: 10.00)
              create(:invoice_item, invoice: invoice, quantity: 2, unit_price: 50.00)
              create(:transaction, invoice: invoice, result: "success")


    expect(invoice.total).to eq(200.00)
  end

  it "can check if it has no transactions" do
    invoice = create(:invoice)

    expect(invoice.has_transactions?).to be false
  end

  context "when paid in full" do
    it "returns as paid in full" do
      invoice = create(:invoice)
                create(:transaction, invoice: invoice, result: "failed")
                create(:transaction, invoice: invoice, result: "success")

      expect(invoice.paid_in_full?).to be true
    end
  end

  context "when not paid in full" do
    it "returns as not paid in full" do
      invoice = create(:invoice)
                create(:transaction, invoice: invoice, result: "failed")
                create(:transaction, invoice: invoice, result: "failed")

      expect(invoice.paid_in_full?).to be false
    end
  end
end
