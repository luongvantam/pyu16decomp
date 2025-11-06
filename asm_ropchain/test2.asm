org 0xE9E0

hex 30 30
setlr
reset_sfr
buffer_clear
er0 = hex cc ea
hex 38 9D 30 30 00 01
er0 = hex 00 02
delay
xr0 = hex 40 10 80 30
line_draw
xr0 = hex 40 10 40 30
line_draw
xr0 = hex 40 30 80 30
line_draw
render.ddd4
er0 = hex 30 d7
getkey
xr0 = hex 30 d7 0e 7b
setlr
cvt_keycode
er8 = hex 1c 00
er8 = hex 30 30
r1 = 0,rt
er2 = hex c4 ea
load_table
er2 = er0,er0 += er4,rt
er8 = hex 08 ea
xr8 = hex 30 30 30 30
xr0 = hex 30 d7 0e 7b
setlr
cvt_keycode
er8 = hex 1c 00
er8 = hex 30 30
r1 = 0,rt
er2 = hex c4 ea
load_table
er2 = er0,er0 += er4,rt
er8 = hex 14 ea
xr8 = hex 30 30 30 30
xr0 = hex 30 d6 84 d1
BL strcpy
er14 = hex 2e d6
sp = er14,pop er14
call 0xFF00
hex 01 00 ff ff
call 0x0
