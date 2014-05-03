N_runs = 10
TIMEOUT_sec = 20

BENCHMARKS = [
    ('001-shl-bin', {
        'input_sizes': [1, 10, 100, 1000, 10000, 100000],
        'mk_input': lambda x: "%s\n" % x,
        'mk_output': lambda x: '0' * x + '1',
    }),
    ('002-add-bins', {
        'input_sizes': [10, 50, 90, 130, 170, 190],
        'mk_input': lambda w: "%d\n%s\n%s\n%d\n" % (w, '1' + '0'*(w-1), '1' + '0'*(w-1), 100*1000),
        'mk_output': lambda w: '1' + '0'*w,
    }),
    ('003-palindrome', {
        'input_sizes': [0.5, 1, 32, 64, 96, 128],
        'mk_input': lambda k: 'a' + 'b'*int(k*1024) + 'a',
        'mk_output': lambda k: 'yes',
    }),
]
