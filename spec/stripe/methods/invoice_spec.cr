require "../../spec_helper"

describe Stripe::Invoice do
  it "create invoice" do
    WebMock.stub(:post, "https://api.stripe.com/v1/invoices")
      .to_return(status: 200, body: File.read("spec/support/create_invoice.json"), headers: {"Content-Type" => "application/json"})

    stripe = Stripe.new("test")
    invoice = stripe.create_invoice(customer: "asdadsa")
    invoice.id.should eq("in_1GSSMkIfhoELGSZww9EgmgFP")
  end

  it "retrieve invoice" do
    WebMock.stub(:get, "https://api.stripe.com/v1/invoices/asddad")
      .to_return(status: 200, body: File.read("spec/support/retrieve_invoice.json"), headers: {"Content-Type" => "application/json"})

    stripe = Stripe.new("test")
    invoice = stripe.retrieve_invoice("asddad")
    invoice.id.should eq("in_1GSSMkIfhoELGSZww9EgmgFP")
  end

  it "update invoice" do
    WebMock.stub(:post, "https://api.stripe.com/v1/invoices/assaas")
      .to_return(status: 200, body: File.read("spec/support/update_invoice.json"), headers: {"Content-Type" => "application/json"})

    stripe = Stripe.new("test")
    invoice = stripe.update_invoice(invoice: "assaas", auto_advance: true)
    invoice.id.should eq("in_1GSSMkIfhoELGSZww9EgmgFP")
  end
end