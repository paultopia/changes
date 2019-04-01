#!/usr/bin/python
import subprocess, sys

def get_changes(extension):
    return subprocess.getoutput("changes " + extension).split("\n")

print(get_changes("txt"))
