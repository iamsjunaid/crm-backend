require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  describe "GET #index" do
    it "returns http success" do
      get "/api/v1/contacts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      contact = Contact.create(name: "Jane Doe", email: "jane@mail.com", customer: customer)
      get "/api/v1/contacts/#{contact.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      post "/api/v1/contacts", params: { contact: { name: "Jane Doe", email: "jane@mail.com", customer_id: customer.id } }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      contact = Contact.create(name: "Jane Doe", email: "jane@mail.com", customer: customer)
      put "/api/v1/contacts/#{contact.id}", params: { contact: { name: "Jane Doe" } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      contact = Contact.create(name: "Jane Doe", email: "jane@mail.com", customer: customer)
      delete "/api/v1/contacts/#{contact.id}"
      expect(response).to have_http_status(:success)
    end
  end
end