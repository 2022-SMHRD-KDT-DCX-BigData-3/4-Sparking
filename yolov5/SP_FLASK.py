from flask import Flask, request, render_template, redirect, url_for, abort, g,jsonify
import urllib.request
import SP_DVC as dvc

app = Flask(__name__)

@app.route("/plz", methods=['POST'])
#@app.route("/controller/parking?apt_dong=101")
#@app.route("/dvc_info")
def spring():
    info = dvc.getDVC_INFO()
    return jsonify(info)
    
@app.route("/tospring")
def spring2():
    
    return "test"
    
if __name__ == '__main__':
    #app.run(host="0.0.0.0",port=8083)
    app.run(host="172.30.1.57",port=8083)
    #app.run(host="172.30.1.69",port=8083)
    #app.run(debug=True,host="localhost",port=8090)
    #http://172.30.1.69:8083/controller/parking?apt_dong=101