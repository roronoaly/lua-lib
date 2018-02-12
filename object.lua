Account = {balance = 0}
function Account:deposit (v)  --注意，此处使用冒号，可以免写self关键字；如果使用.号，第一个参数必须是self
    self.balance = self.balance + v
end

function Account:withdraw (v)  --注意，此处使用冒号，可以免写self关键字；
    if self.balance > v then
        self.balance = self.balance - v
    else
        error("insufficient funds")
    end
end

function Account:new (o)  --注意，此处使用冒号，可以免写self关键字；
    o = o or {}  -- create object if user does not provide one
    setmetatable(o, {__index = self})
    return o
end

a = Account:new()
a:deposit(100)
b = Account:new()
b:deposit(50)
print(a.balance)  -->100
print(b.balance)  -->50
--本来笔者开始是自己写的例子，但发现的确不如Lua作者给的例子经典，所以还是沿用作者的代码。

--定义继承
--定义继承
SpecialAccount = Account:new({limit = 1000}) --开启一个特殊账户类型，这个类型的账户可以取款超过余额限制1000元
function SpecialAccount:withdraw (v)
    if v - self.balance >= self:getLimit() then
        error("insufficient funds")
    end
    self.balance = self.balance - v
end

function SpecialAccount:getLimit ()
    return self.limit or 0
end

spacc = SpecialAccount:new()
spacc:withdraw(100)
print(spacc.balance)  --> -100
acc = Account:new()
-- acc:withdraw(100)     --> 超出账户余额限制，抛出一个错误


local function search (k, plist)
    for i=1, #plist do
    local v = plist[i][k]  -- try 'i'-th superclass
    if v then return v end
    end
end

function createClass (...)
    local c = {} -- new class
    -- class will search for each method in the list of its
    -- parents (`args' is the list of parents)
    args = {...}
    setmetatable(c, {__index = function (self, k)
        return search(k, args)
    end})

    -- prepare `c' to be the metatable of its instances
    c.__index = c

    -- define a new constructor for this new class
    function c:new (o)
        o = o or {}
        setmetatable(o, c)
        return o
    end
    -- return new class
    return c
end

Named = {}
function Named:getname ()
    return self.name
end
function Named:setname (n)
    self.name = n
end

NamedAccount = createClass(Account, Named)   --同时继承Account 和 Named两个类
account = NamedAccount:new{name = "Paul"}    --使用这个多重继承类定义一个实例
print(account:getname())          --> Pauls
account:deposit(100)
print(account.balance)            --> 100


