# -*- coding: utf-8 -*-
import sys
import csv

# utf-8 i/o plz!
from functools import partial
import codecs
codecs.register_error('UnicodeDecodeError', codecs.replace_errors)
open = partial(codecs.open, encoding='utf-8', errors='replace')

import sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)
sys.stdout.errors = 'replace'
sys.stdin = codecs.getreader('utf-8')(sys.stdin)
sys.stdin.errors = 'replace'
sys.stderr = codecs.getwriter('utf-8')(sys.stderr)
sys.stderr.errors = 'replace'

D = set()
for row in csv.reader(sys.stdin):
    s1 = unicode(''.join((row[6], row[7])))
    s2 = unicode(row[8])
    if s2 == u'以下に掲載がない場合':
        continue
    s2s = s2.split(u'、')
    for s in s2s:
        p = s.find(u'（')
        if p != -1:
            s = s[:p]
        D.add((s1, s))

for s1, s2 in D:
    print '\t'.join((s1, s2))
