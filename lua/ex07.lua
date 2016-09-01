function union(left, right)
    local result = {}
        
    for key, value in pairs(left) do 
        result[key] = value 
    end
            
    for key, value in pairs(right) do
        local temp = rawget(left, key)  
        if temp == nil then 
            result[key] = value 
        end
    end
    
    return result
end

function print_tbl(tbl)
    print("[",t,"]")
    for key, value in pairs(tbl) do
        print("{",key,",", value,"}")
    end
end

t = {name = "vorpal", price = 1000}
t2 = {cate = "sword", itemNum = 2}
metaT = { }
setmetatable(t, metaT)

metaT.__add = union

print_tbl(t)
print_tbl(t2)

t3 = t + t2

print_tbl(t3)
