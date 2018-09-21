[Variables]
;路径
InitAudioDataLuaPath = #@#Scripts\Init.lua
MeasureBandPath = #@#MeasureBand.inc
MeterBandPath = MeterBand.inc
DynamicColorPath = #@#Inc\DynamicColor.inc

;音频的数量，由于是双声道，所以总数量会乘以2
;有效范围为 (0 ~ FFTSize / 2 / 2)
BandNum = 100
;音频的方向，0向上，1向下
BackwardDir = 1
;音频宽度
Width = 3
;是否启动动态颜色，1启用
DynamicColor = 1
;启动动态颜色后会忽略此选项，固定颜色
WaveColor = FF00FF

;AudioLevel 参数设置
[MeasureAudio]
Measure = Plugin
Plugin = AudioLevel
;设置指定设备 ( Output OR Input)
Port = Output
;可选值: 256 512 1024 2048 4096
FFTSize = 2048
FFTOverlap = 1024
FFTAttack = 50
FFTDecay = 200
FreqMin = 20
FreqMax = 20000
;检测声音的大小，数值越大，触发的声音越小
Sensitivity = 35
Bands = #BandNum#