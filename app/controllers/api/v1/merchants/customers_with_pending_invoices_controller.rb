class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def index
    # m = Merchant.find(params[:id]).customers.joins("join transactions on transactions.invoice_id = invoices.id").merge(Transaction.pending).distinct
    render json: Merchant.find(params[:id]).customers_with_pending_invoices
  end
end
