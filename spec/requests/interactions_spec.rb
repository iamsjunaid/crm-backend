require 'rails_helper'

RSpec.describe 'Interactions', type: :request do  
  describe "GET #index" do
    it "returns http success" do
      get "/api/v1/interactions"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      contact = Contact.create(name: "Jane Doe", email: "jane@mail.com", customer: customer)
      interaction = Interaction.create(content: "update logs", contact: contact)
      get "/api/v1/interactions/#{interaction.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      contact = Contact.create(name: "Jane Doe", email: "jane@mail.com", customer: customer)
      interaction = Interaction.create(content: "update logs", contact: contact)
      post "/api/v1/interactions", params: { interaction: { content: "update logs", contact_id: contact.id} }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      contact = Contact.create(name: "Jane Doe", email: "jane@mail.com", customer: customer)
      interaction = Interaction.create(content: "update logs", contact: contact)
      put "/api/v1/interactions/#{interaction.id}", params: { interaction: { content: "Inspect", contact: contact } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      customer = Customer.create(name: "John Doe", email: "john@mail.com")
      contact = Contact.create(name: "Jane Doe", email: "jane@mail.com", customer: customer)
      interaction = Interaction.create(content: "update logs", contact: contact)
      delete "/api/v1/interactions/#{interaction.id}"
      expect(response).to have_http_status(:success)
    end
  end

end