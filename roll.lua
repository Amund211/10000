local adr=io.popen("cd"):read()
local dir=string.gsub(adr, "\\", "/")
local os=require "os"

roll=111111

f = assert(io.open(dir.."/Rolls/6.txt", "w"))
while true do
	if string.sub(roll, 6, 6) == "7" then
		roll=roll+4
	end
	if string.sub(roll, 5, 5) == "7" then
		roll=roll+40
	end
	if string.sub(roll, 4, 4) == "7" then
		roll=roll+400
	end
	if string.sub(roll, 3, 3) == "7" then
		roll=roll+4000
	end
	if string.sub(roll, 2, 2) == "7" then
		roll=roll+40000
	end
	if string.sub(roll, 1, 1) == "7" then
		f:close()
		break
	end
	f:write(roll.."\n")
	roll=roll+1
end

f = assert(io.open(dir.."/Rolls/5.txt", "w"))
roll=11111
while true do
	if string.sub(roll, 5, 5) == "7" then
		roll=roll+4
	end
	if string.sub(roll, 4, 4) == "7" then
		roll=roll+40
	end
	if string.sub(roll, 3, 3) == "7" then
		roll=roll+400
	end
	if string.sub(roll, 2, 2) == "7" then
		roll=roll+4000
	end
	if string.sub(roll, 1, 1) == "7" then
		f:close()
		break
	end
	f:write(roll.."\n")
	roll=roll+1
end

f = assert(io.open(dir.."/Rolls/4.txt", "w"))
roll=1111
while true do
	if string.sub(roll, 4, 4) == "7" then
		roll=roll+4
	end
	if string.sub(roll, 3, 3) == "7" then
		roll=roll+40
	end
	if string.sub(roll, 2, 2) == "7" then
		roll=roll+400
	end
	if string.sub(roll, 1, 1) == "7" then
		f:close()
		break
	end
	f:write(roll.."\n")
	roll=roll+1
end

f = assert(io.open(dir.."/Rolls/3.txt", "w"))
roll=111
while true do
	if string.sub(roll, 3, 3) == "7" then
		roll=roll+4
	end
	if string.sub(roll, 2, 2) == "7" then
		roll=roll+40
	end
	if string.sub(roll, 1, 1) == "7" then
		f:close()
		break
	end
	f:write(roll.."\n")
	roll=roll+1
end

f = assert(io.open(dir.."/Rolls/2.txt", "w"))
roll=11
while true do
	if string.sub(roll, 2, 2) == "7" then
		roll=roll+4
	end
	if string.sub(roll, 1, 1) == "7" then
		f:close()
		break
	end
	f:write(roll.."\n")
	roll=roll+1
end

f = assert(io.open(dir.."/Rolls/1.txt", "w"))
roll=1
while true do
	if string.sub(roll, 1, 1) == "7" then
		f:close()
		break
	end
	f:write(roll.."\n")
	roll=roll+1
end


os.execute(dir.."/analyse.lua")
