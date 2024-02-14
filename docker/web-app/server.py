import http.server
import socketserver
import threading
import time

class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'I should go down in 60 sec!')

def run_server():
    PORT = 80
    with socketserver.TCPServer(("", PORT), MyHttpRequestHandler) as httpd:
        print("HTTP server running at port", PORT)
        httpd.serve_forever()

# Start the HTTP server in a separate thread
server_thread = threading.Thread(target=run_server)
server_thread.start()

# Run for 60 seconds
time.sleep(60)

# Stop the server
server_thread.join()