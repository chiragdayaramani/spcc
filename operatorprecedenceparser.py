t = [
['error','>','>','>'],
['<','>','<','>'],
['<','>','>','>'],
['<','<','<','Accept']]
row = ['id','+','*','$']
col = ['id','+','*','$']

stack =[]
top = -1
stack.append('$')
string_length = int(input("Enter length of string : "))
l = []
print("Enter Input")
for i in range(0,string_length):
    a = input()
    l.append(a)
l.append('$')
print("Stack : ",stack)
print("Input Buffer : ",l)
res = 1
while(res == 1):
    b = stack[top]
    c = l[0]
    d = row.index(b)
    e = col.index(l[0])
    if t[d][e] == '<':
        print("\n",l[0]," Push on the stack")
        stack.append(l[0])
        l.remove(l[0])
        print("Stack : ",stack)
        print("Input Buffer : ",l)
    elif t[d][e] == '>':
        print("\n",l[0]," Pop from stack")
        stack.pop()
        print("Stack : ",stack)
        print("Input Buffer : ",l)
    elif b == c == 'id':
        print("Error")
        res = 0
    elif b == c == '$':
        print("String Accepted")
        res = 0

    