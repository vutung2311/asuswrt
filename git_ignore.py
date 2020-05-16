#!/usr/bin/env python

from fileinput import input
from os import path

def find_nth(haystack, needle, n):
    start = haystack.find(needle)
    while start >= 0 and n > 1:
        start = haystack.find(needle, start+len(needle))
        n -= 1
    return start

opened_fds = {}
for line in input():
    line = line.strip()
    print("Processing", line)
    splitter_index = find_nth(line, "/", 4)
    sub_dir_path = line[:splitter_index]
    print("sub_dir_path is", sub_dir_path)
    if not path.isdir(sub_dir_path):
        continue
    ignore_file_name = line[splitter_index+1:]
    print("ignore_file_name is", ignore_file_name)
    git_ignore_path = sub_dir_path + "/.gitignore"
    print("git_ignore_path is", git_ignore_path)
    if sub_dir_path not in opened_fds:
        opened_fds[sub_dir_path] = open(git_ignore_path, "w+")
    opened_fds[sub_dir_path].write(ignore_file_name+"\n")
for fd in opened_fds.values():
    fd.close()