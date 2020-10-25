import sys
import re

print(len(sys.argv))

if(len(sys.argv) != 3):
    print('Invalid arguments')
    sys.exit()

file_input = sys.argv[1]
file_output = file_input + '.md'

f = open(file_input, "r")
lines = f.readlines()

lines_out = []

lines_out.append('# Лабораторная работа №' + sys.argv[2])

code_flag = False

for i in lines:
    s = i
    if(i.strip() == ''):
        continue
    elif(s.strip()[0] == '#'):
        if(code_flag):
            lines_out.append('```')
            code_flag = False
        if(re.match(r'^#[0-9]+$', s.strip()) == None):
            lines_out.append(s.strip()[1:])
        else:
            lines_out.append('## ' + s.strip()[1:])
    elif(re.match(r'^.*#[0-9]+$', s) == None):
        if(code_flag == False):
            lines_out.append('```shell')
            code_flag = True
        lines_out.append(i)
    else:
        s = s.split('#')
        if(code_flag):
            lines_out.append('```')
            code_flag = False
        lines_out.append('## ' + s[-1].strip())
        lines_out.append('```shell')
        lines_out.append('#'.join(s[:-1]))
        code_flag = True

f.close()

lines_out = list(map(lambda x: x.rstrip("\n") + '\n', lines_out))

f = open(file_output, "w")

f.writelines(lines_out)

f.close()