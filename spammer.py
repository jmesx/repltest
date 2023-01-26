import os
import sys
import requests as r
from time import sleep as s

if sys.argv[1] == None or sys.argv[2] == None:
	pass
else:
	wbhk = sys.argv[1]
	chc = sys.argv[2]
	rq = r.post(wbhk, json={"content": "**@everyone Hey skid! You have been decompiled by https://discord.gg/YXXmCnrjHS join up fag!**"})
	print("Attempting message send...")
	if rq.status_code == 204:
		print("Working webhook...")
		s(1)
		r.delete(wbhk)
		print("Deleted webhook...\n")
	else:
		print("Invalid webhook\n")