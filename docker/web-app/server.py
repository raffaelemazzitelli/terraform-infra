import http.server
import socketserver
import threading
import time

number_of_left_requests=10
class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        global number_of_left_requests
        self.send_response(200)
        self.end_headers()
        number_of_left_requests-=1

        self.wfile.write(f'I should go down in {number_of_left_requests}'.encode('utf-8'))
        if number_of_left_requests < 0:
            exit(1)

def run_server():
    PORT = 80
    with socketserver.TCPServer(("", PORT), MyHttpRequestHandler) as httpd:
        print("HTTP server running at port", PORT)
        httpd.serve_forever()


if __name__ =="__main__":
    run_server()