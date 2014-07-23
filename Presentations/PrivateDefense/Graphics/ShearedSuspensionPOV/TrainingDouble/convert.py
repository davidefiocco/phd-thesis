import os

for i in range(15):
	os.system("cp ../Reading1/suspension" + str(i).zfill(2) + ".png .")

for i in range(45):
	os.system("cp ../Reading2/suspension" + str(i).zfill(2) + ".png suspension" + str(i+15).zfill(2) + ".png")
