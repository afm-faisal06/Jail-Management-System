from flask import render_template, session
import MySQLdb
from __main__ import app

def adminDash_route(app):
    @app.route('/adminDash')
    def adminDash():
        if session['email'] != 'walid49@gmail.com':
            return render_template('error.html')
        else:
            # Database connect
            conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
            cursor = conn.cursor()
            # Query execute
            cursor.execute('SELECT role, COUNT(*) as role_count FROM user WHERE role IN (%s, %s, %s) GROUP BY role', ('Cleaner', 'Chef', 'Police'))
            # Matched row in 'user'
            user = cursor.fetchall()


            cursor.execute('''
        SELECT roles.role, COALESCE(COUNT(request.role), 0) as role_count
        FROM (
            SELECT 'Cleaner' as role
            UNION ALL
            SELECT 'Chef' as role
            UNION ALL
            SELECT 'Police' as role
        ) as roles
        LEFT JOIN request ON roles.role = request.role
        GROUP BY roles.role
    ''')
            req = cursor.fetchall()
            return render_template('adminDash.html',user=user,req=req)