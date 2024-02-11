# seeds.rb

# Create customers
customer1 = Customer.create(name: "John Doe", email: "john@example.com")
customer2 = Customer.create(name: "Jane Smith", email: "jane@example.com")

# Create contacts for each customer
contact1 = customer1.contacts.create(name: "Alice Johnson", email: "alice@example.com")
contact2 = customer1.contacts.create(name: "Bob Smith", email: "bob@example.com")
contact3 = customer2.contacts.create(name: "Charlie Brown", email: "charlie@example.com")

# Create interactions for each contact
contact1.interactions.create(content: "Spoke about product details", customer_id: customer1.id)
contact1.interactions.create(content: "Scheduled a follow-up meeting", customer_id: customer1.id)
contact2.interactions.create(content: "Discussed pricing options", customer_id: customer1.id)
contact3.interactions.create(content: "Provided product demo", customer_id: customer2.id)
contact3.interactions.create(content: "Answered technical questions", customer_id: customer2.id)

puts "Dummy data created successfully."
