function Initialize()

	local fileMeterBand = SKIN:MakePathAbsolute(SKIN:GetVariable('MeterBandPath'))
	local BandNum = SKIN:ParseFormula(SKIN:GetVariable('BandNum'))
	
	writeMeterBand(fileMeterBand,BandNum)
end


function writeMeterBand( fileName,num )
	--获取参数
	local flip = SKIN:ParseFormula(SKIN:GetVariable('BackwardDir'))
	local dynamicColor = SKIN:ParseFormula(SKIN:GetVariable('DynamicColor'))
	local waveColor = SKIN:GetVariable('WaveColor')
	local X = SKIN:GetVariable('X')
	local Y = SKIN:GetVariable('Y')
	local W = SKIN:GetVariable('W')
	local H = SKIN:GetVariable('H')
	--判断动态颜色
	if dynamicColor == 1 then waveColor = "[EndR],[EndG],[EndB],200" end

	local format = ''
	local file = io.open(fileName,"r")
	local oldNum = nil
	--数量加倍
	num = num * 2
	
	if file:read(1) == ';' then
		oldNum = file:read("*n")
	end
	file:close()

	if oldNum == nil then oldNum = 0 end
	--Test:强制更新 -- 发布时修改
	oldNum = 0
	
	if(num ~= oldNum) then
		file = io.open(fileName,"w+")

		format = ";"..num.."\n"
		file:write(format)
		
		for i=0,num-1 do
			local screenWidth = SKIN:ParseFormula(SKIN:GetVariable('ScreenAreaWidth'))
			--计算偏移量
			local totalBarWidth = num * 4
			local offsetX = (screenWidth - totalBarWidth) / 2
			local offsetText = ""
			if i == 0 then offsetText = offsetX .. "R" else offsetText = X end

			format = "[MeterBand"..i.."]\n"
			format = format .. "Meter=Bar\n"
			format = format .. "MeasureName=MeasureBand"..i.."\n"
			format = format .. "X="..offsetText.."\n"
			format = format .. "Y="..Y.."\n"
			format = format .. "W="..W.."\n"
			format = format .. "H="..H.."\n"
			format = format .. "Flip="..flip.."\n"
			format = format .. "BarColor="..waveColor.."\n"
			format = format .. "DynamicVariables=1\n"
			file:write(format)
		end
		
		file:close()
 	end
end
