from flask import Flask
helloworld = Flask(__name__)
@helloworld.route("/")
def run():
	return "{'message': 'Hey There Python'}"
@helloworld.route('/1')
def hello1():
    return "Halaman 1"
    
@helloworld.route('/2')
def hello2():
    return "Halaman 2"

@helloworld.route('/3')
def hello3():
    return "Halaman 3"
if __name__ == "__main__":
	helloworld.run(host="0.0.0.0", port=int("3000"), debug=True)
