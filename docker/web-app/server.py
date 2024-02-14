import http.server
import socketserver
import threading
import time

number_of_left_requests=10
version=2
class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        global number_of_left_requests
        self.send_response(200)
        self.end_headers()

                # Check the path of the request
        if self.path == '/':
            # Handle requests to the root path
            self.send_response(200)
            self.end_headers()
            self.wfile.write(f'I AM VERSION: {version} I should go down in {number_of_left_requests}'.encode('utf-8'))
            if number_of_left_requests < 0:
                exit(1)
            number_of_left_requests-=1
        elif self.path == '/favicon.ico':
            # Handle requests for favicon
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'Favicon not found')
        elif self.path == '/healthz':
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b'ok')
        else:
            # Handle other paths
            self.send_response(404)
            self.end_headers()
            self.wfile.write(b'Page not found')
       
def run_server():
    PORT = 80
    with socketserver.TCPServer(("", PORT), MyHttpRequestHandler) as httpd:
        print("HTTP server running at port", PORT)
        httpd.serve_forever()


if __name__ =="__main__":
    run_server()