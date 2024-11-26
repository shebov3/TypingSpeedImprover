local reset = "\27[0m"
local black = "\27[30m"
local red = "\27[31m"
local green = "\27[32m"
local yellow = "\27[33m"
local blue = "\27[34m"
local magenta = "\27[35m"
local cyan = "\27[36m"
local white = "\27[37m"

local words = require("1kwords")

local function letterExists(letter, array)
  for _, value in ipairs(array) do
      if value == letter then
          return true
      end
  end
  return false
end



local groups = require("typingstyles").Custom


local SFBs,SFSs,Doubles,C = {},{},{},{}

for _, word in pairs(words) do
    local SFB
    local SFS
    local Double
    local letterHistory = {}
    for i, letter in utf8.codes(word) do
        local char = utf8.char(letter)
        for _, group in ipairs(groups) do
           
            if #letterHistory > 1 then
                if letterExists(letterHistory[#letterHistory-1],group) and letterExists(char, group) then
                    if char ~= letterHistory[#letterHistory-1] then
                        SFS = letterHistory[#letterHistory-1]..letterHistory[#letterHistory]..char
                        goto skip
                    end
                end
            end
            if #letterHistory > 0 then
                if letterExists(letterHistory[#letterHistory], group) and letterExists(char, group) then
                    SFB=letterHistory[#letterHistory]..char
                    goto skip
                end
                if char == letterHistory[#letterHistory] then
                    Double = letterHistory[#letterHistory]
                    goto skip
                end
            end
        end
        table.insert(letterHistory, char)
    end
    ::skip::
    if Double then
        table.insert(Doubles,word)
    elseif SFB then
        table.insert(SFBs,{word,{SFB}})
    elseif SFS then
        table.insert(SFSs,{word,{SFS}})
    else
        table.insert(C,word)
    end
end

for k, v in pairs(require("typingstyles")) do
    if v == groups then
        print("Typing Style: ",k)
        break
    end
end
-- ! Double Letters
print("\n\n".."Double Letters: "..tostring(math.floor((#Doubles/#words)*1000)/10).."%")
for _, chunk in pairs(Doubles) do
    io.write(chunk," ")
end

-- ! Same Finger Bigram
print("\n\nSFBs: "..tostring(math.floor((#SFBs/#words)*1000)/10).."%")
for _, chunk in pairs(SFBs) do
    --io.write(chunk[1]," ")
    for i=1,#chunk[1] do
        local char = chunk[1]:sub(i,i)
        local char2 = chunk[1]:sub(i+1,i+1)
        
        if char2 then
            if char..char2 == chunk[2][1] then
                io.write(red)
                io.write(char)
            else
                io.write(char)
                io.write(reset)
            end
        end
    end
    io.write(" ")
end

-- ! Disjoint Same Finger Bigram
print("\n\nDSFBs: "..tostring(math.floor((#SFSs/#words)*1000)/10).."%")
for _, chunk in pairs(SFSs) do
    local v
    for i=1,#chunk[1] do
        local char = chunk[1]:sub(i,i)
        local char2 = chunk[1]:sub(i+1,i+1)
        local char3 = chunk[1]:sub(i+2,i+2)
        if char3 then
            if char..char2..char3 == chunk[2][1] then
                v = i
                io.write(yellow)
                io.write(char)
            elseif v then
                if v+2 == i then
                    io.write(char)
                    io.write(reset)
                elseif v+1 == i then
                    io.write(reset)
                    io.write(char)
                    io.write(yellow)
                else
                    io.write(char)
                end
            else
                io.write(char)
            end
        end
    end
    io.write(" ")
end

-- ! Normal Words
print("\n\nWords: "..tostring(math.floor((#C/#words)*1000)/10).."%")
for _, chunk in pairs(C) do
    io.write(chunk," ")
end
