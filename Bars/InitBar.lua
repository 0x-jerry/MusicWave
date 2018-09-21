function Initialize()
	local fileMeterBand = SKIN:MakePathAbsolute(SKIN:GetVariable('MeterBandPath'))
  local BandNum = SKIN:ParseFormula(SKIN:GetVariable('BandNum'))

  print('load init bar')
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
	if dynamicColor == 1 then 
		waveColor = "[ColorR],[ColorG],[ColorB],180"
		SKIN:Bang('!WriteKeyValue Variables ColorIncPath #DynamicColorPath#')
	else
		SKIN:Bang('!WriteKeyValue Variables ColorIncPath " "')
	end

	local format = ''
	local file = io.open(fileName,"r")
	--数量加倍
	num = num * 2
	
  file = io.open(fileName,"w+")

  format = ";"..num.."\n"
  file:write(format)
  
  for i=0,num-1 do
    --计算偏移量
    local offsetX = i * (W + 2)

    format = "[MeterBand"..i.."]\n"
    format = format .. "Meter=Bar\n"
    format = format .. "MeasureName=MeasureBand"..i.."\n"
    format = format .. "X="..offsetX.."\n"
    format = format .. "Y="..Y.."\n"
    format = format .. "W="..W.."\n"
    format = format .. "H="..H.."\n"
    format = format .. "Flip="..flip.."\n"
    format = format .. "BarColor="..waveColor.."\n"
    format = format .. "DynamicVariables="..dynamicColor.."\n"
    file:write(format)
  end

  file:close()
end

