print("----if test")

i = 0
if i == 0 then
    print("i is zero")
elseif i == 1 then
    print("i is one")
else
    print("i is unknown")
end

num = 0
sum = 0

print("----while repeat test")
while num~=1000 do
    sum = sum + num
    num = num + 1
end

print(num)
print(sum)

sum = 0
num = 0

repeat
    sum = sum + num
    num = num + 1
    -- break test
    if sum > 5000 then
        break
    end
until num == 1000

print(num)
print(sum)
