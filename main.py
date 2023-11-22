from flask import Flask, render_template, request, session, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
import MySQLdb
import hashlib

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/jailmanage'
db = SQLAlchemy(app)
app.secret_key = 'jail'

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    password = db.Column(db.String(120), nullable=False)
    role = db.Column(db.String(120), nullable=False)



class Schedule(db.Model):
    email = db.Column(db.String(200), primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    role = db.Column(db.String(120), nullable=False)



@app.route('/')
@app.route('/home')
def home():
    session['email'] = ""
    return render_template('home.html')

@app.route('/login', methods = ['GET','POST'])
def login():
    failed = ""
    session['email'] = ""
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        # Database connect
        conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
        cursor = conn.cursor()
        # Query execute
        cursor.execute('SELECT * FROM user WHERE email = %s', (email,))
        # Matched row in 'user'
        user = cursor.fetchone()
        if user is not None:
            hashed_password = hashlib.sha256(password.encode('utf-8')).hexdigest()
            cursor.execute('SELECT * FROM user WHERE password = %s And email = %s', (hashed_password,email))
            user1 = cursor.fetchone()
            if user1 is not None:
                session['id'] = user[0]
                session['email'] = user[3]
                if user[2] == "Cleaner":
                    return redirect(url_for('cleaner'))
                elif user[2] == "Chef":
                    return redirect(url_for('chef'))

                else:
                    return redirect(url_for('police'))
            else:
                failed = "Password Does Not Match!"
        else:
            failed = "Email Not Found!"
        
    return render_template('login.html', failed=failed)

@app.route('/admin', methods = ['GET','POST'])
def admin():
    failed = ""
    session['email'] = ""
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        # Database connect
        conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
        cursor = conn.cursor()
        # Query execute
        cursor.execute('SELECT * FROM admin WHERE `email` = %s', (email,))
        # Matched row in 'user'
        user = cursor.fetchone()

        if user is not None:
            hashed_password = hashlib.sha256(password.encode('utf-8')).hexdigest()
            cursor.execute('SELECT * FROM admin WHERE password = %s And email = %s', (hashed_password,email))
            user1 = cursor.fetchone()
            if user1 is not None:
                session['email'] = user[1]
                return redirect(url_for('adminDash'))
            else:
                failed = "Password Does Not Matched!"
                # return redirect(url_for('admin'))
        else:
            failed = "Email Not Found!"
    return render_template('admin.html',failed=failed)


@app.route('/cleaner', methods = ['GET','POST'])
def cleaner():
    conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
    cursor = conn.cursor()
    # Query execute
    cursor.execute('SELECT * FROM user WHERE email = %s', (session['email'],))
    # Matched row in 'user'
    user = cursor.fetchone()
    if user != None:
        if user[2] == 'Cleaner':
            # Database connect
            conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
            cursor = conn.cursor()
            # Query execute
            cursor.execute('SELECT * FROM schedule WHERE email = %s And type = %s' , (session['email'],'Not Assigned'))
            # Matched row in 'user'
            user = cursor.fetchall()
            # Create a new tuple with the additional element "Cleaner"
            cursor.execute('SELECT * FROM user WHERE email = %s', (session['email'],))
            # Matched row in 'user'
            user = cursor.fetchall()
            user = user[0] + ('Cleaner',)
            # Create a double tuple with the inner tuple
            user = (user,)
            return render_template('cleaner.html',user=user,email=session['email'])

        else:
            return render_template('error.html')
    else:
        return render_template('error.html')

@app.route('/police', methods = ['GET','POST'])
def police():

    conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
    cursor = conn.cursor()
    # Query execute
    cursor.execute('SELECT * FROM user WHERE email = %s', (session['email'],))
    # Matched row in 'user'
    user = cursor.fetchone()
    if user != None:
        if user[2] == 'Police':
                # Database connect
            conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
            cursor = conn.cursor()
            # Query execute
            cursor.execute('SELECT * FROM schedule WHERE email = %s', (session['email'],))
            # Matched row in 'user'
            user = cursor.fetchall()
            # Database connect
            conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
            cursor = conn.cursor()
            # Query execute
            cursor.execute('SELECT * FROM schedule WHERE email = %s And type = %s' , (session['email'],'Not Assigned'))
            # Matched row in 'user'
            user = cursor.fetchall()
            # Create a new tuple with the additional element "Cleaner"

            cursor.execute('SELECT * FROM user WHERE email = %s', (session['email'],))
            # Matched row in 'user'
            user = cursor.fetchall()
            user = user[0] + ('Police',)
            # Create a double tuple with the inner tuple
            user = (user,)
            return render_template('police.html',user=user,email=session['email'])

        else:
            return render_template('error.html')
    else:
        return render_template('error.html')

@app.route('/chef', methods = ['GET','POST'])
def chef():
    conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
    cursor = conn.cursor()
    # Query execute
    cursor.execute('SELECT * FROM user WHERE email = %s', (session['email'],))
    # Matched row in 'user'
    user = cursor.fetchone()
    if user != None:
        if user[2] == 'Chef':
            # Database connect
            conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
            cursor = conn.cursor()
            # Query execute
            cursor.execute('SELECT * FROM schedule WHERE email = %s', (session['email'],))
            # Matched row in 'user'
            user = cursor.fetchall()
            # Database connect
            conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
            cursor = conn.cursor()
            # Query execute
            cursor.execute('SELECT * FROM schedule WHERE email = %s And type = %s' , (session['email'],'Not Assigned'))
            # Matched row in 'user'
            user = cursor.fetchall()
            # Create a new tuple with the additional element "Cleaner"

            cursor.execute('SELECT * FROM user WHERE email = %s', (session['email'],))
            # Matched row in 'user'
            user = cursor.fetchall()
            user = user[0] + ('Chef',)
            # Create a double tuple with the inner tuple
            user = (user,)
            return render_template('chef.html',user=user,email=session['email'])

        else:
            return render_template('error.html')
    else:
        return render_template('error.html')

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

@app.route('/staffDetails', methods = ['GET','POST'])
def staffDetails():
    info = 'staff'
    if session['email'] != 'walid49@gmail.com':
        return render_template('error.html')
    else:
        failed= ""
        # Database connect
        conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
        cursor = conn.cursor()
        # Query execute
        cursor.execute('SELECT * FROM user')
        # Matched row in 'user'
        user = cursor.fetchall()

        if request.method == 'POST':
            if 'Add' == request.form.get('btn'):
                name = request.form.get('name')
                email = request.form.get('email')
                password = request.form.get('password')
                role = request.form.get('occupation')

                existing_user = User.query.filter_by(email=email).first()
                if existing_user:
                    failed="Email already exists. Please choose a different email!"
                else:
                    #hashed password
                    hashedPassword = hashlib.sha256(password.encode('utf-8')).hexdigest()

                    entry = User(name=name, role=role, password=hashedPassword, email=email)
                    db.session.add(entry)
                    db.session.commit()

                    # Database connect
                    conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
                    cursor = conn.cursor()
                    # Query execute
                    cursor.execute('SELECT * FROM user')
                    # Matched row in 'user'
                    user = cursor.fetchall()
                    failed="Added!"

            elif '🍳' == request.form.get('btn'):
                email = request.form.get('email')
                user = User.query.filter_by(email=email).first()
                # Database connect
                conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
                cursor = conn.cursor()
                # Query execute
                cursor.execute('SELECT * FROM user WHERE email = %s', (email,))
                # Matched row in 'user'
                user = cursor.fetchall()
                    
            else:
                email = request.form.get('email')
                user = User.query.filter_by(email=email).first()
                if user:
                    db.session.delete(user)
                    db.session.commit()
                    user = Schedule.query.filter_by(email=email).first()
                    if user:
                        db.session.delete(user)
                        db.session.commit()
                # Database connect
                conn = MySQLdb.connect(host='localhost', user='root', passwd='', db='jailmanage')
                cursor = conn.cursor()
                # Query execute
                cursor.execute('SELECT * FROM user')
                # Matched row in 'user'
                user = cursor.fetchall()
                # failed="Deleted!"

        return render_template('staffDetails.html',user=user,failed=failed,info=info)


if __name__ == '__main__':
    app.run(debug=True)