local file = io.input("test1.txt")  --使用io.input()函数打开文件

repeat
    local line = io.read()      --逐行读取内容，文件结束时返回nil
    if nil == line then
        break
    end
    print(line)
until (false)


file = io.open("test1.txt", "a+") --使用io.open()函数，以添加模式打开文件


io.output(file)                    --使用io.output()函数，设置默认输出文件
io.write("\nhello world")          --使用io.write()函数，把内容写到文件

io.close(file)       --关闭文件

