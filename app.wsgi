import ctypes

lib = ctypes.CDLL('/var/www/html/hello.so')
hello_world = lib.helloWorld
hello_world.restype = ctypes.c_char_p

def application(environ, start_response):
    status = '200 OK'
    output = hello_world()  # call C++ the function
    response_headers = [('Content-type', 'text/html'), ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]
