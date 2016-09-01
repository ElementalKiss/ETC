print("----numeric for test")
for i = 1, 10 do
    print(i)
end

for i = 1, 10, 2 do -- inc = 2
    print(i)
end

print("----generic for test")
tbl = {"vorpal", "1000", itemCode = 1}

print("---pairs test")
for key, value in pairs(tbl) do
    print(key, value)
end

print("---iparis test")
for index, value in ipairs(tbl) do
    print(index, value)
end

print("---next test")
for key, value in next, tbl, nil do
    print(key, value)
end

print("---io.lines test")
print("--file write")
io.output(io.open("test.txt", "w"))
io.write("Onodera\nDaisuki")
io.close()

print("--file read")
for line in io.lines("test.txt") do
    print(line)
end

print("---file::lines test")
file = assert(io.open("test.txt"), "r")
for line in file:lines() do
    print(line)
end
file:close()
