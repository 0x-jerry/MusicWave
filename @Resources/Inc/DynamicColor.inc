[Variables]
;越大，颜色变化越快
Speed = 5
;计算脚本路径
CalcLuaPath = #@#\Inc\DynamicColor.lua

[MyCount]
Measure = Calc
Formula = ColorValue
UpdateDivider = 10

[ColorValue]
Measure = Calc
Formula = MyCount + #Speed#
UpdateDivider = 10

[ColorHue]
Measure = Calc
Formula = ColorValue % 361 / 360
UpdateDivider = 10

;R
[ColorR]
Measure = Script
ScriptFile = #CalcLuaPath#
UpdateDivider = 10

;G
[ColorG]
Measure = Script
ScriptFile = #CalcLuaPath#
UpdateDivider = 10

;B
[ColorB]
Measure = Script
ScriptFile = #CalcLuaPath#
UpdateDivider = 10

