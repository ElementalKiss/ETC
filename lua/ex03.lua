print("----simple function test")
function sum(num1, num2)
    return num1+num2
end

print(sum(1,2))

print("----global and local value test")

function l_Sum(num1, num2)
    local sumLocal = num1 + num2
    return sumLocal
end

function g_Sum(num1, num2)
    sumGlobal = num1 + num2
    return sumGlobal
end

sumLocal = 0;
sumGlobal = 0;
l_Sum(10, 20)
g_Sum(10, 20)
print("sumLocal = ", sumLocal)
print("sumGlobal = ", sumGlobal)

print("----multiple return test")

function multiRtnFunction()
    return "popura", "onodera"
end

goodGirl1, goodGirl2 = multiRtnFunction()
print(goodGirl1)
print(goodGirl2)
