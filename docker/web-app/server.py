# server.py
from http.server import HTTPServer, BaseHTTPRequestHandler
import threading
import time

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hello, World 2!')

def run_server():
    httpd = HTTPServer(('0.0.0.0', 80), SimpleHTTPRequestHandler)
    httpd.serve_forever()

def shutdown_server_after_timeout(timeout):
    time.sleep(timeout)
    print("Shutting down server after 60 seconds.")
    exit()

if __name__ == '__main__':
    timeout_thread = threading.Thread(target=shutdown_server_after_timeout, args=(60,))
    timeout_thread.start()
    run_server()
