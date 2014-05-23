import math

TIMEOUT_sec = 20
GRAN = 32

def flinspace(first, last, N):
    D = float(last-first) / (N-1)
    return [first + i*D for i in xrange(N)]

def linspace(first, last, N):
    return [int(round(x)) for x in flinspace(first, last, N)]

def logspace(first, last, N):
    return [int(round(math.exp(x))) for x in flinspace(math.log(first), math.log(last), N)]

BENCHMARKS = [
    ('001-shl-bin', {
        'input_sizes': linspace(1, 128*1024, GRAN),
        'mk_input': lambda x: "%s\n" % x,
        'mk_output': lambda x: '0' * x + '1',
        'units': 'left-shift amount, in bits',
    }),
    ('002-add-bins', {
        'input_sizes': linspace(1, 200, GRAN),
        'mk_input': lambda w: "%d\n%s\n%s\n%d\n" % (w, '1' + '0'*(w-1), '1' + '0'*(w-1), 100*1000),
        'mk_output': lambda w: '1' + '0'*w,
        'units': 'word width, in bits',
    }),
    ('003-palindrome', {
        'input_sizes': linspace(1, 128*1024, GRAN),
        'mk_input': lambda k: 'a' + 'b'*k + 'a',
        'mk_output': lambda k: 'yes',
        'units': 'input length, in characters',
    }),
    ('004-effects', {
        'input_sizes': linspace(16, 16, GRAN),
        'mk_input': str,
        'mk_output': lambda sz: str(sz),
        'units': 'units TBD'
    }),
]
