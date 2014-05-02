import os
from flask import Flask
from flask.ext.moresql import MoreSQL

app = Flask(__name__)
app.config['MORESQL_DATABASE_URI'] = 'postgres://docker:docker@'+ os.environ['DB_PORT_5432_TCP_ADDR'] + ':5432/docker'
db = MoreSQL(app)

@app.route('/')
def index():
    return 'Hello World'

@app.route('/show-all/')
def show_all():
    return db.execute('student_list')

if __name__ == '__main__':
     # Bind to PORT if defined, otherwise default to 5000.
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
