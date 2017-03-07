[Variables]
;路径
InitAudioDataLuaPath = #@#Scripts\Init.lua
MeasureBandPath = #@#MeasureBand.inc
MeterBandPath = MeterBand.inc
DynamicColorPath = #@#Inc\DynamicColor.inc

;音频的数量，由于是双声道，所以总数量会乘以2
BandNum = 170
;音频的方向，0向上，1向下
BackwardDir = 1
;音频宽度
Width = 2
;是否启动动态颜色，1启用
DynamicColor = 0
;启动动态颜色后会忽略此选项，固定颜色
WaveColor = FF00FFee

;AudioLevel 参数设置
[MeasureAudio]
Measure=Plugin
Plugin=AudioLevel
Port=Output
FFTSize=2048
FFTAttack=10
FFTDecay=125
;检测声音的大小，数值越大，触发的声音越小
Sensitivity=35
Bands=#BandNum#