NAME_REGEX = /\A[A-Z][a-z]{1,}\s([a-z]{2,}\s)*[a-z]{2,}[.]\z/.freeze
AUTHOR_MANE_REGEX = /\A[A-Z][a-z]+\s([A-Z][a-z]+\s)*[A-Z][a-z]+[.]\z/.freeze
MESSAGE_FORMAT_NAME = 'name must be at least two words with two letters in each word, ' \
                       'the first word with a capital letter, the rest with a small one. ' \
                       'Dot at the end.'.freeze

MESSAGE_FORMAT_AUTHOR = 'must be at least two words with two letters in each word, ' \
                        'the all word with a capital letter. Dot at the end.'.freeze
