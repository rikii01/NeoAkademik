from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_user, logout_user, login_required, current_user
from .models import User

auth_bp = Blueprint("auth", __name__)

@auth_bp.route("/login", methods=["GET", "POST"])
def login():
    if current_user.is_authenticated:
        if current_user.role == "admin":
            return redirect(url_for("admin.dashboard"))
        return redirect(url_for("user.mahasiswa_view"))

    if request.method == "POST":
        username = request.form["username"].strip()
        password = request.form["password"].strip()

        user = User.get_by_username(username)
        if not user or not user.verify_password(password):
            flash("Username/password salah", "error")
            return redirect(url_for("auth.login"))

        login_user(user)

        if user.role == "admin":
            return redirect(url_for("admin.dashboard"))
        return redirect(url_for("user.mahasiswa_view"))

    return render_template("auth/login.html", title="Login")

@auth_bp.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("auth.login"))
