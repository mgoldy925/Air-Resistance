REM Maxwell Goldberg
REM Ff = bv^2 simulation part 2

_FULLSCREEN
SCREEN 12
WINDOW (-0.12, -29)-(1.92, 33)

LINE (0, 0)-(0.84, 0)
LINE (0, 15)-(0, -25)
LINE (0.96, 0)-(1.8, 0)
LINE (0.96, 15)-(0.96, -25)

g = 9.8
m = 10
b = 1.2
dt = 0.0005
x = 0
vi = 10
v = vi
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

FOR t = 0 TO 0.8 STEP dt

    Ff = b * v ^ 2
    Fw = m * g
    a = -(Ff + Fw) / m
    dv = a * dt
    v = v + dv
    dx = v * dt
    x = x + dx

    xc = m / b * LOG(ABS(COS(t * k) + vi * SQR(b / m / g) * SIN(t * k)))
    vc = (vi * SQR(b * g * m) * COS(t * k) - m * g * SIN(t * k)) / (SQR(b * g * m) * COS(t * k) + vi * b * SIN(t * k))
    ac = -b * g * (m * g + b * vi ^ 2) / (SQR(b * g * m) * COS(t * k) + vi * b * SIN(t * k)) ^ 2

    PSET (t, a), 6
    PSET (t, v), 12
    PSET (t, x), 14

    PSET (t + 0.96, ac), 6
    PSET (t + 0.96, vc), 12
    PSET (t + 0.96, xc), 14

    _DELAY 0.001
NEXT t

END

