import re

keyword = ['break', 'case', 'char', 'const', 'continue', 'default', 'do', 'int', 'else', 'enum', 'extern', 'float',
           'for', 'goto', 'if', 'long', 'register', 'return', 'short', 'signed', 'sizeof', 'static', 'switch',
           'typedef', 'union', 'unsigned', 'void', 'volatile', 'while']
built_in_functions = ['clrscr', 'printf', 'scanf', 'getch', 'main', 'pow']
operators = ['+', '-', '*', '/', '%', '==', '!=', '>', '<', '>=', '<=', '&&', '||', '!', '&', '|', '^', '~', '>>', '<<',
             '=', '+=', '-=', '*=']
specialsymbol = ['@', '#', '$', '_', '!', '"']
separator = [',', ':', ';', '\n', '\t', '{', '}', '(', ')', '[', ']']
preprocessing_directives = ['include', 'define', '#include']
libraries = ['stdio.h', 'stdlib.h']

f = open('Exp1.txt', 'r')
i = f.read()
codeline = i.split('\n')
for line in codeline:
    dire = re.findall(r'<(.+?)>', line)
    matches = re.findall(r'"(.+?)"', line)
    comments = re.findall(r'/(.+?)/', line)
    print(f'Comments: {comments[0].replace("*", "")}\n' if len(comments) > 0 else "", end="")
    if comments:
        line = line.replace(comments[0], " ")
        line = line.replace('/', "")
    print(f'Library: {dire[0]}\n' if len(dire) > 0 else "", end="")
    if dire:
        line = line.replace(dire[0], " ")
        line = line.replace('"', "")
    print(f'Literals: {matches[0]}\n' if len(matches) > 0 else "", end="")
    if matches:
        line = line.replace(matches[0], " ")
    for word in line.split():
        if word in libraries:
            print('Library: ', word)
        elif word in operators:
            print("Operator: ", word)
        elif word in specialsymbol:
            print("Special Symbol: ", word)
        elif word in separator:
            print("Separator: ", word)
        elif word.isdigit():
            print('Literal: ', word)
        elif word not in built_in_functions and word not in keyword and word not in preprocessing_directives:
            print("Identifier: ", word)
    tokens = re.split('\W', line)
    for token in tokens:
        if token in preprocessing_directives:
            print('Preprocessing directive: ', token)
        elif token in keyword:
            print('Keyword: ', token)
        elif token in built_in_functions:
            print('Built in function: ', token)

f.close()