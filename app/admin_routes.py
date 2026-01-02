from functools import wraps
from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from .db import get_db

# =========================
# ADMIN GUARD (role check)
# =========================
def admin_only(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        if not current_user.is_authenticated:
            return redirect(url_for("auth.login"))

        if getattr(current_user, "role", None) != "admin":
            flash("Akses ditolak (admin only).", "error")
            return redirect(url_for("user.mahasiswa_view"))

        return fn(*args, **kwargs)
    return wrapper


admin_bp = Blueprint("admin", __name__)

# =========================
# DASHBOARD
# =========================
@admin_bp.route("/dashboard")
@login_required
@admin_only
def dashboard():
    conn = get_db()
    cur = conn.cursor(dictionary=True)

    # total mahasiswa
    cur.execute("SELECT COUNT(*) AS total FROM mahasiswa")
    total = cur.fetchone()["total"]

    # ===== CHART 1: jumlah per prodi =====
    cur.execute("""
        SELECT prodi, COUNT(*) AS jumlah
        FROM mahasiswa
        GROUP BY prodi
        ORDER BY jumlah DESC
    """)
    prodi_rows = cur.fetchall()
    prodi_labels = [r["prodi"] for r in prodi_rows]
    prodi_values = [r["jumlah"] for r in prodi_rows]

    # ===== CHART 2: prodi per fakultas (stacked) =====
    cur.execute("""
        SELECT fakultas, prodi, COUNT(*) AS jumlah
        FROM mahasiswa
        GROUP BY fakultas, prodi
        ORDER BY fakultas ASC, prodi ASC
    """)
    rows = cur.fetchall()

    cur.close()
    conn.close()

    fakultas_list = sorted({r["fakultas"] for r in rows})
    prodi_list = sorted({r["prodi"] for r in rows})

    m = {(r["fakultas"], r["prodi"]): r["jumlah"] for r in rows}

    datasets = []
    for p in prodi_list:
        datasets.append({
            "label": p,
            "data": [m.get((f, p), 0) for f in fakultas_list],
        })

    return render_template(
        "admin/dashboard.html",
        title="Dashboard",
        total=total,

        prodi_labels=prodi_labels,
        prodi_values=prodi_values,

        fakultas_labels=fakultas_list,
        prodi_per_fakultas_datasets=datasets,
    )




# =========================
# READ (List Mahasiswa)
# =========================
@admin_bp.route("/mahasiswa")
@login_required
@admin_only
def mahasiswa_list():
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
        "admin/mahasiswa.html",
        title="Data Mahasiswa",
        mahasiswa=mahasiswa,
        page=page,
        total_pages=total_pages,
        per_page=per_page,
        total=total
    )



# =========================
# CREATE (Tambah Mahasiswa)
# =========================
@admin_bp.route("/mahasiswa/tambah", methods=["GET", "POST"])
@login_required
@admin_only
def mahasiswa_tambah():
    if request.method == "POST":
        nim = request.form.get("nim", "").strip()
        nama = request.form.get("nama", "").strip()
        prodi = request.form.get("prodi", "").strip()
        fakultas = request.form.get("fakultas", "").strip()

        if not nim or not nama or not prodi:
            flash("Semua field wajib diisi.", "error")
            return redirect(url_for("admin.mahasiswa_tambah"))

        conn = get_db()
        cur = conn.cursor()

        try:
            cur.execute(
                "INSERT INTO mahasiswa (nim, nama, fakultas, prodi) VALUES (%s, %s, %s, %s)",
                (nim, nama, fakultas, prodi),
            )
            conn.commit()
            flash("Data berhasil ditambahkan.", "success")
        except Exception as e:
            conn.rollback()
            flash(f"Gagal menambahkan data: {e}", "error")
        finally:
            cur.close()
            conn.close()

        return redirect(url_for("admin.mahasiswa_list"))

    return render_template(
        "admin/mahasiswa_form.html",
        title="Tambah Mahasiswa",
        data=None,
        action=url_for("admin.mahasiswa_tambah"),
    )


# =========================
# UPDATE (Edit Mahasiswa)
# =========================
@admin_bp.route("/mahasiswa/edit/<int:id>", methods=["GET", "POST"])
@login_required
@admin_only
def mahasiswa_edit(id):
    conn = get_db()
    cur = conn.cursor(dictionary=True)

    if request.method == "POST":
        nim = request.form.get("nim", "").strip()
        nama = request.form.get("nama", "").strip()
        fakultas = request.form.get("fakultas", "").strip()
        prodi = request.form.get("prodi", "").strip()

        if not nim or not nama or not fakultas or not prodi:
            flash("Semua field wajib diisi.", "error")
            cur.close()
            conn.close()
            return redirect(url_for("admin.mahasiswa_edit", id=id))

        try:
            cur2 = conn.cursor()
            cur2.execute(
                "UPDATE mahasiswa SET nim=%s, nama=%s, fakultas=%s, prodi=%s WHERE id=%s",
                (nim, nama, fakultas, prodi, id),
            )
            conn.commit()
            cur2.close()
            flash("Data berhasil diupdate.", "success")
        except Exception as e:
            conn.rollback()
            flash(f"Gagal update data: {e}", "error")
        finally:
            cur.close()
            conn.close()

        return redirect(url_for("admin.mahasiswa_list"))

    # ===== GET REQUEST =====
    cur.execute("SELECT * FROM mahasiswa WHERE id=%s", (id,))
    data = cur.fetchone()
    cur.close()
    conn.close()

    if not data:
        flash("Data tidak ditemukan.", "error")
        return redirect(url_for("admin.mahasiswa_list"))

    return render_template(
        "admin/mahasiswa_form.html",
        title="Edit Mahasiswa",
        data=data,
        action=url_for("admin.mahasiswa_edit", id=id),
    )



# =========================
# DELETE (Hapus Mahasiswa)
# =========================
@admin_bp.route("/mahasiswa/hapus/<int:id>", methods=["POST"])
@login_required
@admin_only
def mahasiswa_hapus(id):
    conn = get_db()
    cur = conn.cursor()

    try:
        cur.execute("DELETE FROM mahasiswa WHERE id=%s", (id,))
        conn.commit()
        flash("Data berhasil dihapus.", "success")
    except Exception as e:
        conn.rollback()
        flash(f"Gagal hapus data: {e}", "error")
    finally:
        cur.close()
        conn.close()

    return redirect(url_for("admin.mahasiswa_list"))
