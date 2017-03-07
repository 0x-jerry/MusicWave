[Variables]
;越大，颜色变化越快
Speed = 1


[MyCount]
Measure = Calc
Formula = ColorValue

[ColorValue]
Measure = Calc
Formula = MyCount + #Speed#

[ColorHue]
Measure = Calc
Formula = ColorValue % 361 / 360

;R
[R0]
Measure = Calc
Formula = ColorHue + 1/3

[R1]
Measure = Calc
Formula = R0 < 0 ? (R0 + 1) : (R0 > 1 ? R0 - 1: R0)

[R2]
Measure = Calc
Formula = (R1 * 6) < 1 ? 6 * R1 : (R1 * 2 < 1 ? 1 : (R1 * 3 < 2 ? ((2.0 / 3.0) - R1) * 6.0 : 0))

[EndR]
Measure = Calc
Formula = ((R2 > 1) ? 1 : ((R2 < 0) ? 0 : R2)) * 255
;G
[G0]
Measure = Calc
Formula = ColorHue

[G1]
Measure = Calc
Formula = G0 < 0 ? (G0 + 1) : (G0 > 1 ? G0 - 1: G0)

[G2]
Measure = Calc
Formula = (G1 * 6) < 1 ? 6 * G1 : (G1 * 2 < 1 ? 1 : (G1 * 3 < 2 ? ((2.0 / 3.0) - G1) * 6.0 : 0))

[EndG]
Measure = Calc
Formula = ((G2 > 1) ? 1 : ((G2 < 0) ? 0 : G2)) * 255
;B
[B0]
Measure = Calc
Formula = ColorHue - 1/3

[B1]
Measure = Calc
Formula = B0 < 0 ? (B0 + 1) : (B0 > 1 ? B0 - 1: B0)

[B2]
Measure = Calc
Formula = (B1 * 6) < 1 ? 6 * B1 : (B1 * 2 < 1 ? 1 : (B1 * 3 < 2 ? ((2.0 / 3.0) - B1) * 6.0 : 0))

[EndB]
Measure = Calc
Formula = ((B2 > 1) ? 1 : ((B2 < 0) ? 0 : B2)) * 255

