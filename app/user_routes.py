from flask import Blueprint, render_template, request
from flask_login import login_required
from .db import get_db

user_bp = Blueprint("user", __name__, url_prefix="/user")

@user_bp.route("/mahasiswa")
@login_required
def mahasiswa_view():
    page = request.args.get("page", 1, type=int)
    per_page = 10
    offset = (page - 1) * per_page

    conn = get_db()
    cur = conn.cursor(dictionary=True)

    cur.execute("""
        SELECT * FROM mahasiswa
        ORDER BY id DESC
        LIMIT %s OFFSET %s
    """, (per_page, offset))
    mahasiswa = cur.fetchall()

    cur.execute("SELECT COUNT(*) AS total FROM mahasiswa")
    total = cur.fetchone()["total"]

    cur.close()
    conn.close()

    total_pages = (total + per_page - 1) // per_page

    return render_template(
        "user/mahasiswa_view.html",
        title="Data Mahasiswa",
        mahasiswa=mahasiswa,
        page=page,
        total_pages=total_pages,
        per_page=per_page,
        total=total,
    )
