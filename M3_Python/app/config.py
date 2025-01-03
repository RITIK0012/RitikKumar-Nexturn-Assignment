class Config:
    SQLALCHEMY_DATABASE_URI = 'sqlite:///books.db'  # SQLite Database URI
    SQLALCHEMY_TRACK_MODIFICATIONS = False  # Disable Flask-SQLAlchemy event system
