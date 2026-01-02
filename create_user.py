from app import create_app
from app.models import User

app = create_app()

with app.app_context():
    User.create_user("user1", "user123")
    print("User dibuat: user1 / user123")
