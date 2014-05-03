N_runs = 2
TIMEOUT_sec = 15

BENCHMARKS = [
    ('001-shl-bin', {
        'input_sizes': [1, 10, 100, 1000, 10000, 100000],
        'mk_input': lambda x: "%s\n" % x,
        'mk_output': lambda x: '0' * x + '1',
    }),
    ('002-add-bins', {
        'input_sizes': [1, 5, 9, 13, 17, 19],
        'mk_input': lambda w: "%d\n%s\n%s\n%d\n" % (w, '1' + '0'*(w-1), '1' + '0'*(w-1), 1000*1000),
        'mk_output': lambda w: '1' + '0'*w,
    }),
    ('003-palindrome', {
        'input_sizes': [1, 32, 64, 96, 128],
        'mk_input': lambda k: 'a' + 'b'*(k*1024) + 'a',
        'mk_output': lambda k: 'yes',
    }),
]
