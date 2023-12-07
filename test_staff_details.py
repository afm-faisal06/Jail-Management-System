import unittest
from flask import Flask, session, request
from flask_testing import TestCase
from flask_sqlalchemy import SQLAlchemy
from models.model import db, User, Schedule
from routes.route import staffDetails_route
from main import create_app

class TestStaffDetailsRoute(TestCase):
    def create_app(self):
        app = Flask(__name__)
        app.config['TESTING'] = True
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
        app.config['WTF_CSRF_ENABLED'] = False
        app.secret_key = 'jail'

        staffDetails_route(app)
        db.init_app(app)

        return app

    def setUp(self):
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()

    def test_staffDetails_authenticated(self):
        with self.app.test_request_context('/staffDetails'):
            # Set up a fake session with the required email
            session['email'] = 'walid49@gmail.com'

            # Mock a POST request to simulate form submission
            with self.client.post('/staffDetails', data=dict(
                    btn='Add',
                    name='John Doe',
                    email='john@example.com',
                    password='password123',
                    occupation='Chef'
            ), follow_redirects=True) as response:
                self.assert200(response)
                self.assertIn(b'Added!', response.data)

            # Add more assertions based on the expected behavior of your staffDetails route

    def test_staffDetails_unauthenticated(self):
        with self.app.test_request_context('/staffDetails'):
            # Do not set the session['email'] to simulate an unauthenticated user
            response = self.client.get('/staffDetails')
            self.assertTemplateUsed('error.html')
            # Add more assertions based on the expected behavior for unauthenticated users

if __name__ == '__main__':
    unittest.main()
