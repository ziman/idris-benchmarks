N_runs = 5
TIMEOUT_sec = 15

BENCHMARKS = [
    ('001-shl-bin', {
        'input_sizes': [1, 10, 100, 1000, 10000, 100000],
        'mkinput': lambda x: "%s\n" % x,
    }),
    ('002-add-bins', {
        'input_sizes': [],
        'mkinput': None,
    }),
    ('003-palindrome', {
        'input_sizes': [],
        'mkinput': None,
    }),
]
