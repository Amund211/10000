--This project is licensed under the terms of the GNU General Public License v3.0.
local adr=io.popen("cd"):read()
local dir=string.gsub(adr, "\\", "/")



--------------Initial Calculation---------------------


o = assert(io.open(dir.."/analysed.txt", "w"))

local dice = {}

for diceNum=6, 1, -1 do
	i = assert(io.open(dir.."/Rolls/"..diceNum..".txt", "r"))
	
	local totScore=0
	local totRolls=0
	local totWins=0
	
	local DiceLeft= {}
	for itr4=0, 5 do
		DiceLeft[itr4]=0
	end
	
	local tmpDiceLeft=0
	local tmpScore=0
	
	while true do
	
		local line = i:read()
		if line == nil then break end
		for itr=1,diceNum do
			dice[itr]=string.sub(line, itr, itr)
		end
		table.sort(dice)
		
		do --Point Calculation
		
			--Special combinations
			if diceNum==6 then
			
				if tonumber(dice[1])==1 then
					if tonumber(dice[2])==2 then
						if tonumber(dice[3])==3 then
							if tonumber(dice[4])==4 then
								if tonumber(dice[5])==5 then
									if tonumber(dice[6])==6 then
										tmpScore=2000
										dice = {}
									end
								end
							end
						end
					end
				end
				
			
			
				for itr1=1, 6 do	
					if tonumber(dice[1])==itr1 then
						if tonumber(dice[2])==itr1 then
							local bl1=itr1
							for itr2=1, 6 do
								if itr2==bl1 then else
									if tonumber(dice[3])==itr2 then
										if tonumber(dice[4])==itr2 then
											local bl2=itr2
											for itr3=1, 6 do
												if itr3==bl1 then elseif itr3==bl2 then else
													if tonumber(dice[5])==itr3 then
														if tonumber(dice[6])==itr3 then
															dice={}
															tmpScore=1500										
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
			
				end
		
			
			end
			
			
			
			
			--Regular numbers
			
			if tonumber(dice[1])==1 then
				tmpScore=tmpScore+100
				table.remove(dice, 1)
				if tonumber(dice[1])==1 then
					tmpScore=tmpScore+100
					table.remove(dice, 1)
					if tonumber(dice[1])==1 then
						tmpScore=tmpScore+800
						table.remove(dice, 1)
						if tonumber(dice[1])==1 then
							tmpScore=tmpScore+1000
							table.remove(dice, 1)
							if tonumber(dice[1])==1 then
								tmpScore=tmpScore+2000
								table.remove(dice, 1)
								if tonumber(dice[1])==1 then
									tmpScore=tmpScore+4000
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==2 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==2 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==2 then
						tmpScore=tmpScore+200
						tmpDiceLeft=tmpDiceLeft-2
						table.remove(dice, 1)
						if tonumber(dice[1])==2 then
							tmpScore=tmpScore+200
							table.remove(dice, 1)
							if tonumber(dice[1])==2 then
								tmpScore=tmpScore+400
								table.remove(dice, 1)
								if tonumber(dice[1])==2 then
									tmpScore=tmpScore+800
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==3 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==3 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==3 then
						tmpScore=tmpScore+300
						table.remove(dice, 1)
						tmpDiceLeft=tmpDiceLeft-2
						if tonumber(dice[1])==3 then
							tmpScore=tmpScore+300
							table.remove(dice, 1)
							if tonumber(dice[1])==3 then
								tmpScore=tmpScore+600
								table.remove(dice, 1)
								if tonumber(dice[1])==3 then
									tmpScore=tmpScore+1200
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==4 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==4 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==4 then
						tmpScore=tmpScore+400
						table.remove(dice, 1)
						tmpDiceLeft=tmpDiceLeft-2
						if tonumber(dice[1])==4 then
							tmpScore=tmpScore+400
							table.remove(dice, 1)
							if tonumber(dice[1])==4 then
								tmpScore=tmpScore+800
								table.remove(dice, 1)
								if tonumber(dice[1])==4 then
									tmpScore=tmpScore+1600
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==5 then 
				tmpScore=tmpScore+50
				table.remove(dice, 1)
				if tonumber(dice[1])==5 then
					tmpScore=tmpScore+50
					table.remove(dice, 1)
					if tonumber(dice[1])==5 then
						tmpScore=tmpScore+400
						table.remove(dice, 1)
						if tonumber(dice[1])==5 then
							tmpScore=tmpScore+500
							table.remove(dice, 1)
							if tonumber(dice[1])==5 then
								tmpScore=tmpScore+1000
								table.remove(dice, 1)
								if tonumber(dice[1])==5 then
									tmpScore=tmpScore+2000
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==6 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==6 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==6 then
						tmpScore=tmpScore+600
						table.remove(dice, 1)
						tmpDiceLeft=tmpDiceLeft-2
						if tonumber(dice[1])==6 then
							tmpScore=tmpScore+600
							table.remove(dice, 1)
							if tonumber(dice[1])==6 then
								tmpScore=tmpScore+1200
								table.remove(dice, 1)
								if tonumber(dice[1])==6 then
									tmpScore=tmpScore+2400
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
		end
		
		
		totRolls=totRolls+1
		if tmpScore>0 then
			totScore=totScore+tmpScore
			totWins=totWins+1
		end
		
		for itr4=0, 5 do
			if tmpDiceLeft==itr4 then
				DiceLeft[itr4]=tonumber(DiceLeft[itr4])+1
			end
		end
		
	
		
		tmpScore=0
		tmpDiceLeft=0
		
		
	end
	
	
	if diceNum==1 then
		o:write(diceNum.." die:\n")
	else
		o:write(diceNum.." dice:\n")
	end
	
	o:write("Total Rolls: "..totRolls.."\n")
	o:write("Total Wins: "..totWins.."\n")
	o:write("Total Score: "..totScore.."\n")
	o:write("\n")
	o:write("Win Percentage: "..(totWins/totRolls*100).."%\n")
	o:write("Average Score per Win: "..(totScore/totWins).."\n")
	o:write("Effective Average Score: "..(totScore/totWins*totWins/totRolls).."\n")
	o:write("Largest bet for average profit: "..(totWins/totRolls*totScore/totWins/(1-totWins/totRolls)).."\n")
	for itr5=5, 0, -1 do
		if diceNum>itr5 then
			o:write("Chance for "..itr5.." dice remaining: "..(tonumber(DiceLeft[itr5])/totRolls*100).."\n")
		end	
	end
	
	
	
	
	o:write("\n")
	o:write("-----------------------------------------")
	
	if diceNum>1 then
		o:write("\n")
		o:write("\n")
	end
	
	--Saving values to tables
	_G["Stats"..diceNum]={}
	_G["Stats"..diceNum]["EffAvg"]=totScore/totWins*totWins/totRolls
	_G["Stats"..diceNum]["WinChance"]=totWins/totRolls
	for itr6=5, 0, -1 do
		if diceNum>itr6 then
			_G["Stats"..diceNum]["Rem"..itr6]=tonumber(DiceLeft[itr6])/totRolls
		end	
	end
	

end

--------------Recursive Effective Average--------------- 

local RecEffAvg={}

RecEffAvg[1]=Stats1["EffAvg"]+(Stats6["EffAvg"]*Stats1["Rem0"])
local tmpLastVal1=(Stats6["EffAvg"]*Stats1["Rem0"])

RecEffAvg[2]=Stats2["EffAvg"]+(Stats6["EffAvg"]*Stats2["Rem0"]+RecEffAvg[1]*Stats2["Rem1"])
local tmpLastVal2=(Stats6["EffAvg"]*Stats2["Rem0"]+RecEffAvg[1]*Stats2["Rem1"])

RecEffAvg[3]=Stats3["EffAvg"]+(Stats6["EffAvg"]*Stats3["Rem0"]+RecEffAvg[1]*Stats3["Rem1"]+RecEffAvg[2]*Stats3["Rem2"])
local tmpLastVal3=(Stats6["EffAvg"]*Stats3["Rem0"]+RecEffAvg[1]*Stats3["Rem1"]+RecEffAvg[2]*Stats3["Rem2"])

RecEffAvg[4]=Stats4["EffAvg"]+(Stats6["EffAvg"]*Stats4["Rem0"]+RecEffAvg[1]*Stats4["Rem1"]+RecEffAvg[2]*Stats4["Rem2"]+RecEffAvg[3]*Stats4["Rem3"])
local tmpLastVal4=(Stats6["EffAvg"]*Stats4["Rem0"]+RecEffAvg[1]*Stats4["Rem1"]+RecEffAvg[2]*Stats4["Rem2"]+RecEffAvg[3]*Stats4["Rem3"])

RecEffAvg[5]=Stats5["EffAvg"]+(Stats6["EffAvg"]*Stats5["Rem0"]+RecEffAvg[1]*Stats5["Rem1"]+RecEffAvg[2]*Stats5["Rem2"]+RecEffAvg[3]*Stats5["Rem3"]+RecEffAvg[4]*Stats5["Rem4"])
local tmpLastVal5=(Stats6["EffAvg"]*Stats5["Rem0"]+RecEffAvg[1]*Stats5["Rem1"]+RecEffAvg[2]*Stats5["Rem2"]+RecEffAvg[3]*Stats5["Rem3"]+RecEffAvg[4]*Stats5["Rem4"])

RecEffAvg[6]=Stats6["EffAvg"]+(RecEffAvg[1]*Stats6["Rem1"]+RecEffAvg[2]*Stats6["Rem2"]+RecEffAvg[3]*Stats6["Rem3"]+RecEffAvg[4]*Stats6["Rem4"]+RecEffAvg[5]*Stats6["Rem5"])
local tmpLastVal6=(RecEffAvg[1]*Stats6["Rem1"]+RecEffAvg[2]*Stats6["Rem2"]+RecEffAvg[3]*Stats6["Rem3"]+RecEffAvg[4]*Stats6["Rem4"]+RecEffAvg[5]*Stats6["Rem5"])



for itr7=1, 1 do

RecEffAvg[1]=RecEffAvg[1]-tmpLastVal1
RecEffAvg[1]=RecEffAvg[1]+(RecEffAvg[6]*Stats1["Rem0"])
local tmpLastVal1=(RecEffAvg[6]*Stats1["Rem0"])

RecEffAvg[2]=RecEffAvg[2]-tmpLastVal2
RecEffAvg[2]=RecEffAvg[2]+(RecEffAvg[6]*Stats2["Rem0"]+RecEffAvg[1]*Stats2["Rem1"])
local tmpLastVal2=(RecEffAvg[6]*Stats2["Rem0"]+RecEffAvg[1]*Stats2["Rem1"])

RecEffAvg[3]=RecEffAvg[3]-tmpLastVal3
RecEffAvg[3]=RecEffAvg[3]+(RecEffAvg[6]*Stats3["Rem0"]+RecEffAvg[1]*Stats3["Rem1"]+RecEffAvg[2]*Stats3["Rem2"])
local tmpLastVal3=(RecEffAvg[6]*Stats3["Rem0"]+RecEffAvg[1]*Stats3["Rem1"]+RecEffAvg[2]*Stats3["Rem2"])

RecEffAvg[4]=RecEffAvg[4]-tmpLastVal4
RecEffAvg[4]=RecEffAvg[4]+(RecEffAvg[6]*Stats4["Rem0"]+RecEffAvg[1]*Stats4["Rem1"]+RecEffAvg[2]*Stats4["Rem2"]+RecEffAvg[3]*Stats4["Rem3"])
local tmpLastVal4=(RecEffAvg[6]*Stats4["Rem0"]+RecEffAvg[1]*Stats4["Rem1"]+RecEffAvg[2]*Stats4["Rem2"]+RecEffAvg[3]*Stats4["Rem3"])

RecEffAvg[5]=RecEffAvg[5]-tmpLastVal5
RecEffAvg[5]=RecEffAvg[5]+(RecEffAvg[6]*Stats5["Rem0"]+RecEffAvg[1]*Stats5["Rem1"]+RecEffAvg[2]*Stats5["Rem2"]+RecEffAvg[3]*Stats5["Rem3"]+RecEffAvg[4]*Stats5["Rem4"])
local tmpLastVal5=(RecEffAvg[6]*Stats5["Rem0"]+RecEffAvg[1]*Stats5["Rem1"]+RecEffAvg[2]*Stats5["Rem2"]+RecEffAvg[3]*Stats5["Rem3"]+RecEffAvg[4]*Stats5["Rem4"])

RecEffAvg[6]=RecEffAvg[6]-tmpLastVal6
RecEffAvg[6]=RecEffAvg[6]+(RecEffAvg[1]*Stats6["Rem1"]+RecEffAvg[2]*Stats6["Rem2"]+RecEffAvg[3]*Stats6["Rem3"]+RecEffAvg[4]*Stats6["Rem4"]+RecEffAvg[5]*Stats6["Rem5"])
local tmpLastVal6=(RecEffAvg[1]*Stats6["Rem1"]+RecEffAvg[2]*Stats6["Rem2"]+RecEffAvg[3]*Stats6["Rem3"]+RecEffAvg[4]*Stats6["Rem4"]+RecEffAvg[5]*Stats6["Rem5"])

end



--------------Recursive Smart Calculation---------------------

o = assert(io.open(dir.."/Analysed_Recursive.txt", "w"))

local dice = {}

for diceNum=6, 1, -1 do
	i = assert(io.open(dir.."/Rolls/"..diceNum..".txt", "r"))
	
	local totScore=0
	local totRolls=0
	local totWins=0
	
	local DiceLeft= {}
	for itr4=0, 5 do
		DiceLeft[itr4]=0
	end
	
	local tmpDiceLeft=0
	local tmpScore=0
	
	while true do
	
		local line = i:read()
		if line == nil then break end
		for itr=1,diceNum do
			dice[itr]=string.sub(line, itr, itr)
		end
		table.sort(dice)
		
		do --Point Calculation
		
			--Special combinations
			if diceNum==6 then
			
				if tonumber(dice[1])==1 then
					if tonumber(dice[2])==2 then
						if tonumber(dice[3])==3 then
							if tonumber(dice[4])==4 then
								if tonumber(dice[5])==5 then
									if tonumber(dice[6])==6 then
										tmpScore=2000
										dice = {}
									end
								end
							end
						end
					end
				end
				
			
			
				for itr1=1, 6 do	
					if tonumber(dice[1])==itr1 then
						if tonumber(dice[2])==itr1 then
							local bl1=itr1
							for itr2=1, 6 do
								if itr2==bl1 then else
									if tonumber(dice[3])==itr2 then
										if tonumber(dice[4])==itr2 then
											local bl2=itr2
											for itr3=1, 6 do
												if itr3==bl1 then elseif itr3==bl2 then else
													if tonumber(dice[5])==itr3 then
														if tonumber(dice[6])==itr3 then
															dice={}
															tmpScore=1500										
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
			
				end
		
			
			end
			
			
			
			
			--Regular numbers
			
			if tonumber(dice[1])==1 then
				tmpScore=tmpScore+100
				table.remove(dice, 1)
				if tonumber(dice[1])==1 then
					tmpScore=tmpScore+100
					table.remove(dice, 1)
					if tonumber(dice[1])==1 then
						tmpScore=tmpScore+800
						table.remove(dice, 1)
						if tonumber(dice[1])==1 then
							tmpScore=tmpScore+1000
							table.remove(dice, 1)
							if tonumber(dice[1])==1 then
								tmpScore=tmpScore+2000
								table.remove(dice, 1)
								if tonumber(dice[1])==1 then
									tmpScore=tmpScore+4000
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==2 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==2 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==2 then
						tmpScore=tmpScore+200
						tmpDiceLeft=tmpDiceLeft-2
						table.remove(dice, 1)
						if tonumber(dice[1])==2 then
							tmpScore=tmpScore+200
							table.remove(dice, 1)
							if tonumber(dice[1])==2 then
								tmpScore=tmpScore+400
								table.remove(dice, 1)
								if tonumber(dice[1])==2 then
									tmpScore=tmpScore+800
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==3 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==3 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==3 then
						tmpScore=tmpScore+300
						table.remove(dice, 1)
						tmpDiceLeft=tmpDiceLeft-2
						if tonumber(dice[1])==3 then
							tmpScore=tmpScore+300
							table.remove(dice, 1)
							if tonumber(dice[1])==3 then
								tmpScore=tmpScore+600
								table.remove(dice, 1)
								if tonumber(dice[1])==3 then
									tmpScore=tmpScore+1200
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==4 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==4 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==4 then
						tmpScore=tmpScore+400
						table.remove(dice, 1)
						tmpDiceLeft=tmpDiceLeft-2
						if tonumber(dice[1])==4 then
							tmpScore=tmpScore+400
							table.remove(dice, 1)
							if tonumber(dice[1])==4 then
								tmpScore=tmpScore+800
								table.remove(dice, 1)
								if tonumber(dice[1])==4 then
									tmpScore=tmpScore+1600
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==5 then 
				tmpScore=tmpScore+50
				table.remove(dice, 1)
				if tonumber(dice[1])==5 then
					tmpScore=tmpScore+50
					table.remove(dice, 1)
					if tonumber(dice[1])==5 then
						tmpScore=tmpScore+400
						table.remove(dice, 1)
						if tonumber(dice[1])==5 then
							tmpScore=tmpScore+500
							table.remove(dice, 1)
							if tonumber(dice[1])==5 then
								tmpScore=tmpScore+1000
								table.remove(dice, 1)
								if tonumber(dice[1])==5 then
									tmpScore=tmpScore+2000
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
			
			if tonumber(dice[1])==6 then 
				table.remove(dice, 1)
				tmpDiceLeft=tmpDiceLeft+1
				if tonumber(dice[1])==6 then
					table.remove(dice, 1)
					tmpDiceLeft=tmpDiceLeft+1
					if tonumber(dice[1])==6 then
						tmpScore=tmpScore+600
						table.remove(dice, 1)
						tmpDiceLeft=tmpDiceLeft-2
						if tonumber(dice[1])==6 then
							tmpScore=tmpScore+600
							table.remove(dice, 1)
							if tonumber(dice[1])==6 then
								tmpScore=tmpScore+1200
								table.remove(dice, 1)
								if tonumber(dice[1])==6 then
									tmpScore=tmpScore+2400
									table.remove(dice, 1)
								end
							end
						end
					end
				end
			end
		end
		
		
		totRolls=totRolls+1
		if tmpScore>0 then
			totScore=totScore+tmpScore
			totWins=totWins+1
		end
		
		for itr4=0, 5 do
			if tmpDiceLeft==itr4 then
				DiceLeft[itr4]=tonumber(DiceLeft[itr4])+1
			end
		end
		
	
		
		tmpScore=0
		tmpDiceLeft=0
		
		
	end
	
	
	if diceNum==1 then
		o:write(diceNum.." die:\n")
	else
		o:write(diceNum.." dice:\n")
	end
	
	o:write("Total Rolls: "..totRolls.."\n")
	o:write("Total Wins: "..totWins.."\n")
	o:write("Total Score: "..totScore.."\n")
	o:write("\n")
	o:write("Win Percentage: "..(totWins/totRolls*100).."%\n")
	o:write("Average Score per Win: "..(totScore/totWins).."\n")
	o:write("Effective Average Score: "..(totScore/totWins*totWins/totRolls).."\n")
	o:write("Largest bet for average profit: "..(totWins/totRolls*totScore/totWins/(1-totWins/totRolls)).."\n")
	o:write("Recursive Effective Average: "..RecEffAvg[diceNum].."\n")
	
	local tmpRecWinChance2=Stats1["WinChance"]*Stats2["WinChance"])
	local tmpRecWinChance3=Stats1["WinChance"]*(Stats2["WinChance"]+Stats3["WinChance"])/2
	local tmpRecWinChance4=Stats1["WinChance"]*(Stats2["WinChance"]+Stats3["WinChance"]+Stats4["WinChance"])/3
	local tmpRecWinChance5=Stats1["WinChance"]*(Stats2["WinChance"]+Stats3["WinChance"]+Stats4["WinChance"]+Stats5["WinChance"])/4
	local tmpRecWinChance6=Stats1["WinChance"]*(Stats2["WinChance"]+Stats3["WinChance"]+Stats4["WinChance"]+Stats5["WinChance"]+Stats5["WinChance"])/5
	
	if diceNum>1 then
		o:write("Largest bet for average profite recursively: "..((_G["Stats"..diceNum]["WinChance"])*RecEffAvg[diceNum]/((1-(_G[tmpRecWinChance..diceNum]))).."\n"))
	else
		o:write("Largest bet for average profite recursively: "..(Stats1["WinChance"]*RecEffAvg[diceNum]/(1-Stats1["WinChance"])).."\n")
	end
	
	
	for itr5=5, 0, -1 do
		if diceNum>itr5 then
			o:write("Chance for "..itr5.." dice remaining: "..(tonumber(DiceLeft[itr5])/totRolls*100).."\n")
		end	
	end
	
	
	
	
	o:write("\n")
	o:write("-----------------------------------------")
	
	if diceNum>1 then
		o:write("\n")
		o:write("\n")
	end
	
		--Saving values to tables
	_G["Stats"..diceNum]={}
	_G["Stats"..diceNum]["EffAvg"]=totScore/totWins*totWins/totRolls
	for itr6=5, 0, -1 do
		if diceNum>itr6 then
			_G["Stats"..diceNum]["Rem"..itr6]=tonumber(DiceLeft[itr6])/totRolls*100
		end	
	end
	

end