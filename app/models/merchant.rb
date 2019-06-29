class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def self.most_revenue(merchant_limit)
    select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .group(:id)
    .order('revenue DESC')
    .limit(merchant_limit)
  end

  def self.most_items(merchant_limit)
    select('merchants.*, SUM(invoice_items.quantity) AS total_items')
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .group(:id)
    .order('total_items DESC')
    .order(:id)
    .limit(merchant_limit)
  end

  def favorite_customer
    Customer.select('customers.*, COUNT(transactions.id) AS total_transactions')
    .joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .where("invoices.merchant_id = ?", self.id)
    .group(:id)
    .order('total_transactions DESC')
    .first
  end

  def customers_with_pending_invoices ### Boss Mode
    # Customer.joins(invoices: :transactions)
    # .where(transactions: {result: "failed"})
    # .where("invoices.merchant_id = ?", self.id)
    # .distinct
    # customers_with_failing_transactions = Customer.select('customers.*')
    # .joins(invoices: :transactions)
    # .where.not(transactions: {result: "success"})
    # .where("invoices.merchant_id = ?", self.id)
    # .distinct.to_a
    #
    # Invoice.joins(:transactions)
    # .where.not(transactions: {result: "success"})
    # .where()
  end
end
