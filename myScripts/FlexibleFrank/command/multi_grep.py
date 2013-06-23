# -*- coding: utf-8 -*-
import os
import re

search_dir = r'D:\grepsample'
search_pattern = "execute"

file_name_list = os.listdir(search_dir)
for file_name in file_name_list:
    f = open(os.path.join(search_dir, file_name))
    line = f.readline()
    line_number = 1
    while line:
        m = re.search(search_pattern, line)
        if m:
            print "Pattern Found: file:%s, line:%d, data:%s" % (file_name, line_number, line)
        line = f.readline()
        line_number = line_number + 1
    f.close()
