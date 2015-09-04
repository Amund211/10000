--This project is licensed under the terms of the GNU General Public License v3.0.
local adr=io.popen("cd"):read()
local dir=string.gsub(adr, "\\", "/")

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
	_G["Stats"..diceNum]["totRolls"]=totRolls
	_G["Stats"..diceNum]["totWins"]=totWins
	_G["Stats"..diceNum]["totScore"]=totScore
	

end
