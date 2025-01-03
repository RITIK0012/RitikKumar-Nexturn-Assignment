from app import create_app
from app.models import db

app = create_app()

with app.app_context():
    db.create_all()  # Creates all tables defined in the models
    print("Database initialized!")
