import json
import os

BOOKS_FILE = "data/books.json"

class Book:
    def __init__(self, title, author, price, quantity):
        self.title = title
        self.author = author
        self.price = price
        self.quantity = quantity

    def display(self):
        return f"{self.title} by {self.author} | Price: {self.price} | Quantity: {self.quantity}"

def load_books():
    if not os.path.exists(BOOKS_FILE):
        return []
    with open(BOOKS_FILE, "r") as file:
        return json.load(file)

def save_books(books):
    with open(BOOKS_FILE, "w") as file:
        json.dump(books, file, indent=4)

def add_book(title, author, price, quantity):
    books = load_books()
    books.append({"title": title, "author": author, "price": price, "quantity": quantity})
    save_books(books)
    print("Book added successfully!")

def view_books():
    books = load_books()
    if not books:
        print("No books available.")
    else:
        for book in books:
            print(f"{book['title']} by {book['author']} | Price: {book['price']} | Quantity: {book['quantity']}")

def search_book(query):
    books = load_books()
    results = [book for book in books if query.lower() in book['title'].lower() or query.lower() in book['author'].lower()]
    if not results:
        print("No matching books found.")
    else:
        for book in results:
            print(f"{book['title']} by {book['author']} | Price: {book['price']} | Quantity: {book['quantity']}")
