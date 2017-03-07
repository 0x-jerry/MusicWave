function Initialize(  )

	local fileMeasureBand = SKIN:MakePathAbsolute(SKIN:GetVariable('MeasureBandPath'))
	local fileMeterBand = SKIN:MakePathAbsolute(SKIN:GetVariable('MeterBandPath'))
	local BandNum = SKIN:ParseFormula(SKIN:GetVariable('BandNum'))
	
	writeMeasureBand(fileMeasureBand,BandNum)
end

function writeMeasureBand( fileName,num )
	local format = ''
	local file = io.open(fileName,"r")
	local oldNum = nil

	if file:read(1) == ';' then
		oldNum = file:read("*n")
	end
	file:close()

	if oldNum == nil then oldNum = 0 end

	if(num ~= oldNum) then
		file = io.open(fileName,"w+")

		format = ";"..num.."\n"
		file:write(format)

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
end
