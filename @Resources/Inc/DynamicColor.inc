[Variables]
;越大，颜色变化越大
ColorUpdateSpeed = 5
;越小，颜色变化越快
ColorUpdateRate = 5

;计算脚本路径
CalcLuaPath = #@#\Inc\DynamicColor.lua

[MyCount]
Measure = Calc
Formula = ColorValue
UpdateDivider = #ColorUpdateRate#

[ColorValue]
Measure = Calc
Formula = MyCount + #ColorUpdateSpeed#
UpdateDivider = #ColorUpdateRate#

[ColorHue]
Measure = Calc
Formula = ColorValue % 361 / 360
UpdateDivider = #ColorUpdateRate#

;R
[ColorR]
Measure = Script
ScriptFile = #CalcLuaPath#
UpdateDivider = #ColorUpdateRate#

;G
[ColorG]
Measure = Script
ScriptFile = #CalcLuaPath#
UpdateDivider = #ColorUpdateRate#

;B
[ColorB]
Measure = Script
ScriptFile = #CalcLuaPath#
UpdateDivider = #ColorUpdateRate#

