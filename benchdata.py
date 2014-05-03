N_runs = 5
TIMEOUT_sec = 15

BENCHMARKS = [
    ('001-shl-bin', {
        'input_sizes': [1, 10, 100, 1000, 10000, 100000],
        'mk_input': lambda x: "%s\n" % x,
        'mk_output': lambda x: '0' * x + '1',
    }),
    ('002-add-bins', {
        'input_sizes': [1, 5, 9, 13, 17, 19],
        'mk_input': lambda w: "%d\n%d\n%d\n" % (w, 2**(w-1) - 1, 2**(w-1)),
        'mk_output': lambda w: str(2**w - 1),
    }),
    ('003-palindrome', {
        'input_sizes': [],
        'mk_input': None,
        'mk_output': None,
    }),
]
