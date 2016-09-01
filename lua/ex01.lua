a = 1 -- integer
b = "koko" -- string
c = nil -- NULL

print("----normal print")

print(a)
print(b)
print(c)

print("----type test")

print(type(a))
print(type(b))
print(type(c))

print("----table test")

eqTable = {"vorpal sword", 1000000, "sword"}

lastValue = #eqTable

for i=1,lastValue do
    print(eqTable[i])
end

print("----table test2")

eqTable2 = { 1, name = "vorpal", price=1 }
print(eqTable2[1])
print(eqTable2.name, eqTable2.price)

eqTable2.cate = "sword"
print(eqTable2.cate)


