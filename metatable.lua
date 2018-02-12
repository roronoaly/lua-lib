set1 = {10, 20, 30}--集合
set2 = {20, 40, 50}--集合

union = function (self, another) --将用于重载__add的函数，注意第一个参数是self
    local set = {}
    local result = {}
    --利用数组来确保集合的互异性
    for i, j in pairs(self) do set[j] = true end
    for i, j in pairs(another) do set[j] = true end
    --加入结果集合
    for i, j in pairs(set) do table.insert(result, i) end
    return result
end
setmetatable(set1, {__add = union}) --重载set1表的__add元方法

set3 = set1 + set2
for _,j in pairs(set3) do
    io.write(j.." ")  -->输出结果30 50 20 40 10
end


mytable = setmetatable({key1 = "value1"}, --原始表
  {__index = function(self, key)       --重载函数
    if key == "key2" then
      return "metatablevalue"
    else
      return self[key]
    end
  end
})

print(mytable.key1,mytable.key2)  -->value1 metatablevalue


arr = {1, 2, 3, 4}
arr = setmetatable(arr, {__tostring = function (self)
    local result = '{'
    local sep = ''
    for _, i in pairs(self) do
        result = result ..sep .. i
        sep = ', '
    end
    result = result .. '}'
    return result
end})
print(arr)  --> {1, 2, 3, 4}

functor = {}
function func1(self, arg)
  print ("called from", arg)
end

setmetatable(functor, {__call = func1})

functor("functor")  --> called from functor
print(functor)  --> table: 0x00076fc8   后面这串数字可能不一样