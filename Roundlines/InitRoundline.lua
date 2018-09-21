function Initialize(  )
	local fileMeterBand = SKIN:MakePathAbsolute(SKIN:GetVariable('MeterBandPath'))
	local BandNum = SKIN:ParseFormula(SKIN:GetVariable('BandNum'))
	
	writeMeterBand(fileMeterBand,BandNum)
end


function writeMeterBand( fileName,num )
	--获取参数
	local flip = SKIN:ParseFormula(SKIN:GetVariable('BackwardDir'))
	local waveColor = SKIN:GetVariable('WaveColor')
	local X = SKIN:GetVariable('X')
	local Y = SKIN:GetVariable('Y')
	local W = SKIN:GetVariable('W')

	local format = ''
	--数量加倍
	num = num * 2
	
  file = io.open(fileName,"w+")

  format = ";"..num.."\n"
  file:write(format)
  
  for i=0,num-1 do
    local screenWidth = SKIN:ParseFormula(SKIN:GetVariable('ScreenAreaWidth'))
    --计算偏移量

    format = "[MeterBand"..i.."]\n"
    format = format .. "Meter=Roundline\n"
    format = format .. "LineStart=".."20".."\n"
    format = format .. "LineLength=[MeasureBand"..i.."]\n"
    format = format .. "LineColor="..waveColor.."\n"
    format = format .. "LineWidth="..W.."\n"
    format = format .. "StartAngle="..2*math.pi/num*i.."\n"
    format = format .. "RotationAngle="..2*math.pi/num*(i+1).."\n"
    format = format .. "X="..X.."\n"
    format = format .. "Y="..Y.."\n"
    format = format .. "DynamicVariables=".."1".."\n"

    file:write(format)
  end
  
  file:close()
end
