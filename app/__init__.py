import os
from flask import Flask
from flask_login import LoginManager
from .models import User

login_manager = LoginManager()
login_manager.login_view = "auth.login"

def create_app():
    base_dir = os.path.dirname(os.path.abspath(__file__))  # folder app/

    app = Flask(
        __name__,
        template_folder=os.path.join(base_dir, "templates"),
        static_folder=os.path.join(base_dir, "static"),
    )

    # config
    from .config import Config
    app.config.from_object(Config)

    login_manager.init_app(app)

    # blueprints
    from .auth_routes import auth_bp
    from .admin_routes import admin_bp

    app.register_blueprint(auth_bp)
    app.register_blueprint(admin_bp, url_prefix="/admin")

    from .user_routes import user_bp
    app.register_blueprint(user_bp)


    return app

@login_manager.user_loader
def load_user(user_id):
    return User.get_by_id(int(user_id))
