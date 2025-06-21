#!/usr/bin/env python3

import base64
import argparse
from http.server import HTTPServer, SimpleHTTPRequestHandler

def parse_args():
    parser = argparse.ArgumentParser(description="Python HTTP server with optional Basic Auth.")
    parser.add_argument("--port", type=int, default=8000, help="Port to serve on (default: 8000)")
    parser.add_argument("--user", help="Username for Basic Auth (if provided, password is required)")
    parser.add_argument("--password", dest="password", help="Password for Basic Auth")
    return parser.parse_args()

class AuthHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        self.username = kwargs.pop("username")
        self.password = kwargs.pop("password")
        super().__init__(*args, **kwargs)

    def do_AUTHHEAD(self):
        self.send_response(401)
        self.send_header("WWW-Authenticate", 'Basic realm="Protected"')
        self.send_header("Content-type", "text/html")
        self.end_headers()

    def do_GET(self):
        auth_header = self.headers.get("Authorization")
        if auth_header is None:
            self.do_AUTHHEAD()
            self.wfile.write(b"Auth required.")
        elif auth_header.startswith("Basic "):
            encoded_credentials = auth_header.split(" ")[1]
            decoded_credentials = base64.b64decode(encoded_credentials).decode("utf-8")
            if decoded_credentials == f"{self.username}:{self.password}":
                super().do_GET()
            else:
                self.do_AUTHHEAD()
                self.wfile.write(b"Invalid credentials.")
        else:
            self.do_AUTHHEAD()
            self.wfile.write(b"Unsupported auth method.")

if __name__ == "__main__":
    args = parse_args()

    if args.user and args.password:
        handler = lambda *h_args, **h_kwargs: AuthHandler(*h_args, username=args.user, password=args.password, **h_kwargs)
        print(f"Basic Auth enabled - user: {args.user}")
    else:
        handler = SimpleHTTPRequestHandler
        print("No authentication enabled")

    server_address = ("", args.port)
    httpd = HTTPServer(server_address, handler)
    print(f"Serving at port {args.port}...")
    httpd.serve_forever()
