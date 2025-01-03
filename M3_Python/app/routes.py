from flask import Blueprint, request, jsonify
from .models import db, Book

main_routes = Blueprint('main_routes', __name__)

# Add a new book
@main_routes.route('/books', methods=['POST'])
def add_book():
    data = request.get_json()
    title = data.get('title')
    author = data.get('author')
    published_year = data.get('published_year')
    genre = data.get('genre')

    if not title or not author or not published_year or not genre:
        return jsonify({"error": "Invalid data", "message": "All fields are required"}), 400

    new_book = Book(title=title, author=author, published_year=published_year, genre=genre)
    db.session.add(new_book)
    db.session.commit()

    return jsonify({"message": "Book added successfully", "book_id": new_book.id}), 201

# Retrieve all books
@main_routes.route('/books', methods=['GET'])
def get_books():
    books = Book.query.all()
    return jsonify([book.to_dict() for book in books])

# Retrieve a book by ID
@main_routes.route('/books/<int:id>', methods=['GET'])
def get_book(id):
    book = Book.query.get(id)
    if not book:
        return jsonify({"error": "Book not found", "message": "No book exists with the provided ID"}), 404
    return jsonify(book.to_dict())

# Update a book by ID
@main_routes.route('/books/<int:id>', methods=['PUT'])
def update_book(id):
    data = request.get_json()
    book = Book.query.get(id)
    if not book:
        return jsonify({"error": "Book not found", "message": "No book exists with the provided ID"}), 404

    book.title = data.get('title', book.title)
    book.author = data.get('author', book.author)
    book.published_year = data.get('published_year', book.published_year)
    book.genre = data.get('genre', book.genre)

    db.session.commit()
    return jsonify({"message": "Book updated successfully"})

# Delete a book by ID
@main_routes.route('/books/<int:id>', methods=['DELETE'])
def delete_book(id):
    book = Book.query.get(id)
    if not book:
        return jsonify({"error": "Book not found", "message": "No book exists with the provided ID"}), 404

    db.session.delete(book)
    db.session.commit()
    return jsonify({"message": "Book deleted successfully"})
