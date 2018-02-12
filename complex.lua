local _M = {}   -- 局部变量，模块名称

function _M.new(r, i)
   return {r = r, i = i}
end

function  _M.add(c1, c2)  --复数加法
    return  _M.new(c1.r + c2.r, c1.i + c2.i)
end

function  _M.sub(c1, c2)  --复数减法
    return  _M.new(c1.r - c2.r, c1.i - c2.i)
end

return  _M  -- 返回模块的table