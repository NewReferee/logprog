import os
f = open('my_tree.ged')
people = {}
father = []
mother = []
line = f.readline().split()
while len(line)>0:
	if len(line)<3:
		pass
	elif line[2] == 'INDI':
		no = line[1]
		while (line[1] != 'RIN'):
			line = f.readline().split()
			if len(line) == 0:
				break
			if line[1] == 'GIVN':
				name = line[2]
			if line[1] == 'SURN':
				surname = line[2]
			if (line[1] == '_MARNM'):
				surname = line[2]
		people[no] = "'"+surname+' '+name+"'"
	elif line[2] == 'FAM':
		wife = ""
		husband = ""
		line = f.readline().split()
		line = f.readline().split()
		if line[1] == 'HUSB':
			husband = people[line[2]]
			line = f.readline().split()
		if line[1] == 'WIFE':			
			wife = people[line[2]]
			line = f.readline().split()
		while (line[1] == 'CHIL'):
			if len(husband)>0:
				pair = (husband, people[line[2]])
				father.append(pair)
			if len(wife)>0:
				pair = (wife, people[line[2]])
				mother.append(pair)
			line = f.readline().split()


	line = f.readline().split()
for a in father:
    print("father({0}, {1}).".format(a[0], a[1]))
for a in mother:
    print("mother({0}, {1}).".format(a[0], a[1]))


