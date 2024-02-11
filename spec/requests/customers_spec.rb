require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe "GET #index" do
    it "returns http success" do
      get "/api/v1/customers"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      get "/api/v1/customers/#{customer.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post "/api/v1/customers", params: { customer: { name: "John Doe", email: "john@mail.com" } }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      put "/api/v1/customers/#{customer.id}", params: { customer: { name: "Jane Doe" } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      delete "/api/v1/customers/#{customer.id}"
      expect(response).to have_http_status(:success)
    end
  end
end