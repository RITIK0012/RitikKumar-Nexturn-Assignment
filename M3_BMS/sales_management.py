import json
import os

SALES_FILE = "data/sales.json"
from book_management import load_books, save_books
from customer_management import load_customers

class Transaction:
    def __init__(self, customer_name, book_title, quantity_sold):
        self.customer_name = customer_name
        self.book_title = book_title
        self.quantity_sold = quantity_sold

def load_sales():
    if not os.path.exists(SALES_FILE):
        return []
    with open(SALES_FILE, "r") as file:
        return json.load(file)

def save_sales(sales):
    with open(SALES_FILE, "w") as file:
        json.dump(sales, file, indent=4)

def sell_book(customer_name, book_title, quantity):
    books = load_books()
    customers = load_customers()
    sales = load_sales()

    # Check if customer exists
    if not any(customer['name'] == customer_name for customer in customers):
        print("Customer not found. Add the customer first.")
        return

    # Check if book exists and is in stock
    for book in books:
        if book['title'].lower() == book_title.lower():
            if book['quantity'] >= quantity:
                book['quantity'] -= quantity
                save_books(books)
                sales.append({"customer_name": customer_name, "book_title": book_title, "quantity_sold": quantity})
                save_sales(sales)
                print(f"Sale successful! Remaining quantity: {book['quantity']}")
                return
            else:
                print(f"Error: Only {book['quantity']} copies available. Sale cannot be completed.")
                return
    print("Book not found.")

def view_sales():
    sales = load_sales()
    if not sales:
        print("No sales records found.")
    else:
        for sale in sales:
            print(f"{sale['customer_name']} bought {sale['quantity_sold']} copies of {sale['book_title']}")
