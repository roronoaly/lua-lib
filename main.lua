local complex = require "complex"

local com1 = complex.new(0, 1)

local com2 = complex.new(1, 2)

local ans = complex.add(com1, com2)
print(ans.r, ans.i)      -->output  1     3




local str = "abcde"
print("case 1:", str:sub(1, 2))
print("case 2:", str.sub(str, 1, 2))


local obj={x=20}
function obj:fun1()
    print(self.x)
end


local obj={x=20}
function obj.fun1(self)
    print(self.x)
end

obj.fun1(obj)