#!/usr/bin/python
    
import sys
import json
from collections import defaultdict

data1 = defaultdict(lambda: 0)
data2 = defaultdict(list)
data3 = {
        'counts': defaultdict(lambda: 0),
        'id_by_type': defaultdict(list),
        }
data4 = []

for line in sys.stdin:
    id, type, priority = line.strip().split()

    data1[type] += 1
    data2[type].append(id)
    data3['counts'][type] += 1
    data3['id_by_type'][type].append(id)

    data4.append(id)


final = [data1, data2, data3, data4]

print json.dumps(final, indent=2)
