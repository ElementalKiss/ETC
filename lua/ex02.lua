print("----swap test")
num1 = 10
num2 = 100

num1, num2 = num2, num1

print(num1)
print(num2)

print("----type cast test")

num = 10
str = "1"
str2 = "1a"

numPstr = num+str
--numPstr2 = num+str2 --ERROR

print(numPstr)
print(type(numPstr))

newStr = str..num

print(newStr)
print(type(newStr))
