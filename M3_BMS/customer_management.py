import json
import os

CUSTOMERS_FILE = "data/customers.json"

class Customer:
    def __init__(self, name, email, phone):
        self.name = name
        self.email = email
        self.phone = phone

    def display(self):
        return f"{self.name} | Email: {self.email} | Phone: {self.phone}"

def load_customers():
    if not os.path.exists(CUSTOMERS_FILE):
        return []
    with open(CUSTOMERS_FILE, "r") as file:
        return json.load(file)

def save_customers(customers):
    with open(CUSTOMERS_FILE, "w") as file:
        json.dump(customers, file, indent=4)

def add_customer(name, email, phone):
    customers = load_customers()
    customers.append({"name": name, "email": email, "phone": phone})
    save_customers(customers)
    print("Customer added successfully!")

def view_customers():
    customers = load_customers()
    if not customers:
        print("No customers available.")
    else:
        for customer in customers:
            print(f"{customer['name']} | Email: {customer['email']} | Phone: {customer['phone']}")
