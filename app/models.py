from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from .db import get_db

class User(UserMixin):
    def __init__(self, id, username, password_hash, role):
        self.id = id
        self.username = username
        self.password_hash = password_hash
        self.role = role

    @staticmethod
    def get_by_id(user_id):
        conn = get_db()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT * FROM users WHERE id=%s", (user_id,))
        row = cur.fetchone()
        cur.close(); conn.close()
        if not row:
            return None
        return User(row["id"], row["username"], row["password_hash"], row["role"])

    @staticmethod
    def get_by_username(username):
        conn = get_db()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT * FROM users WHERE username=%s", (username,))
        row = cur.fetchone()
        cur.close(); conn.close()
        if not row:
            return None
        return User(row["id"], row["username"], row["password_hash"], row["role"])

    @staticmethod
    def create_admin(username, password):
        conn = get_db()
        cur = conn.cursor()
        pw_hash = generate_password_hash(password)
        cur.execute(
            "INSERT INTO users (username, password_hash, role) VALUES (%s, %s, 'admin')",
            (username, pw_hash),
        )
        conn.commit()
        cur.close(); conn.close()

    @staticmethod
    def create_user(username, password):
        conn = get_db()
        cur = conn.cursor()
        pw_hash = generate_password_hash(password)
        cur.execute(
            "INSERT INTO users (username, password_hash, role) VALUES (%s, %s, 'user')",
            (username, pw_hash),
        )
        conn.commit()
        cur.close(); conn.close()

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)
