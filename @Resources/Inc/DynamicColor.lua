
function Initialize(  )
	print("Load Lua: DynamicColor.Lua")
end

function Update( )
	local colorHue = SKIN:GetMeasure('ColorHue')
	local hsv = colorHue:GetValue()
	local value = hsv
	local name = SELF:GetName()
	
	if string.find(name,"R") ~= nil then value = hsv + 1.0/3.0 end
	if string.find(name,"B") ~= nil then value = hsv - 1.0/3.0 end

	if value < 0 then 
		value = value + 1
	elseif value > 1 then
		value = value -1
	end

	if value * 6 < 1 then
		value = value * 6.0
	elseif value * 2 < 1 then
		value = 1
	elseif value * 3 < 2 then
		value = (2.0 / 3.0 - value) * 6.0
	else
		value = 0
	end

	if value > 1 then 
		value = 1
	elseif value < 0 then 
		value = 0
	end

	return value * 255
end

