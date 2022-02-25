REM Maxwell Goldberg
REM Ff = bv^2 simulation

_FULLSCREEN
SCREEN 12
WINDOW (-1, -11)-(15, 4)

LINE (0, 0)-(6, 0)
LINE (0, 0)-(0, -10)
LINE (8, 0)-(14, 0)
LINE (8, 0)-(8, -10)

g = 9.8
m = 10
b = 1.2
dt = 0.001
x = 0
v = 0
k = SQR(b * g / m)

LOCATE 2, 20
PRINT "Ball with Air Resistance Simulator - bv^2"

LOCATE 4, 12
COLOR 14: PRINT "Displacement"
LOCATE 4, 36
COLOR 12: PRINT "Velocity"
LOCATE 4, 56
COLOR 6: PRINT "Acceleration"

LOCATE 7, 10
COLOR 3: PRINT "Numerical Integration"
LOCATE 7, 56
PRINT "Calculus"
COLOR 15

SLEEP

FOR t = 0 TO 3 STEP dt

    Ff = b * v ^ 2
    Fw = m * g
    a = (Ff - Fw) / m
    dv = a * dt
    v = v + dv
    dx = v * dt
    x = x + dx

    xc = -m / b * LOG(COSH(t * SQR(b * g / m)))
    vc = -SQR(m * g / b) * TANH(t * k)
    ac = -g / (COSH(t * k)) ^ 2

    PSET (2 * t, a), 6
    PSET (2 * t, v), 12
    PSET (2 * t, x), 14

    PSET (2 * t + 8, ac), 6
    PSET (2 * t + 8, vc), 12
    PSET (2 * t + 8, xc), 14

    _DELAY 0.001
NEXT t

END


' Thank you to the QB64 wiki for these functions

FUNCTION COSH (x) ' Hyperbolic Cosine
    IF x <= 88.02969 THEN COSH = (EXP(x) + EXP(-x)) / 2 ELSE BEEP
END FUNCTION

FUNCTION TANH (x) ' Hyperbolic Tangent or SINH(x) / COSH(x)
    IF 2 * x <= 88.02969 AND EXP(2 * x) + 1 <> 0 THEN
        TANH = (EXP(2 * x) - 1) / (EXP(2 * x) + 1)
    ELSE BEEP
    END IF
END FUNCTION



