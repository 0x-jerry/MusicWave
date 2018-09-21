function Initialize(  )
	local fileMeasureBand = SKIN:MakePathAbsolute(SKIN:GetVariable('MeasureBandPath'))
  local BandNum = SKIN:ParseFormula(SKIN:GetVariable('BandNum'))

  print("Load Lua: Init.Lua")
  print(fileMeasureBand)
	writeMeasureBand(fileMeasureBand,BandNum)
end

function writeMeasureBand( fileName,num )
  file = io.open(fileName,"w+")

  local format = ""

  --左声道
  for i=0,num-1 do
    format = "[MeasureBand"..i.."]\n"
    format = format .. "Measure=Plugin\n"
    format = format .. "Plugin=AudioLevel\n"
    format = format .. "Parent=MeasureAudio\n"
    format = format .. "Type=Band\n"
    --BandIdx num-1 ~ 0
    format = format .. "BandIdx="..num-1-i.."\n"
    format = format .. "Channel=L\n"

    file:write(format)
  end
  --右声道
  for i=num,2*num-1 do
    format = "[MeasureBand"..i.."]\n"
    format = format .. "Measure=Plugin\n"
    format = format .. "Plugin=AudioLevel\n"
    format = format .. "Parent=MeasureAudio\n"
    format = format .. "Type=Band\n"
    --BandIdx 0 ~ num-1
    format = format .. "BandIdx="..i - num.."\n"
    format = format .. "Channel=R\n"

    file:write(format)
  end

  file:close()
end
