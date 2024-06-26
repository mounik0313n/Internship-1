from flask import Flask, render_template, request, jsonify
from flask_mail import Mail, Message
import mysql.connector

app = Flask(__name__)

# Configuration for Flask-Mail with Gmail
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'jp2335066@gmail.com'
app.config['MAIL_PASSWORD'] = 'pqpxzuubeqmdpgda'  # Replace with your actual Gmail password or app password

# MySQL database connection
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",  # Replace with your MySQL username
        password="12345678",  # Replace with your MySQL password
        database="emailsender"  # Replace with your database name
    )

mail = Mail(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/register', methods=['POST'])
def register():
    try:
        username = request.form['username']
        emailid = request.form['emailid']

        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("INSERT INTO users (username, emailid) VALUES (%s, %s)", (username, emailid))
        connection.commit()

        # Fetch the default message from the database or set a default message
        default_message = "Welcome to our service!"

        # Send welcome email
        msg = Message(
            'Welcome to Our Service!',
            sender='jp2335066@gmail.com',
            recipients=[emailid]
        )
        msg.body = default_message
        mail.send(msg)

        cursor.close()
        connection.close()

        return jsonify({'message': 'User registered successfully and welcome email sent'})
    except mysql.connector.Error as e:
        return jsonify({'error': str(e)}), 500


@app.route('/send_all_emails')
def send_emails():
    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT emailid, message FROM users")
        users = cursor.fetchall()

        for user in users:
            msg = Message(
                'Welcome to Our Service!',
                sender='jp2335066@gmail.com',
                recipients=[user['emailid']]
            )
            msg.body = user.get('message', 'Welcome to our service!')
            mail.send(msg)
        
        cursor.close()
        connection.close()
        return render_template('index.html', message="Welcome emails sent successfully")
    except mysql.connector.Error as e:
        return render_template('index.html', message=f"An error occurred: {str(e)}")

if __name__ == '__main__':
    app.run(debug=True)
