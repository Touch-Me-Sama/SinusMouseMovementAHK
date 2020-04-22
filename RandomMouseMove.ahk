
; #Warn  ; Enable warnings to assist with detecting common errors.
Send Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;OPTIMIZATIONS START
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1


RandomMouseMove(x2,y2, Speed)
{
	;Starting Point
	MouseGetPos, x1, y1
	pi := 3.1461
	d := Round(sqrt((x2-x1)**2 + (y2-y1)**2))
	phi := acos((x2-x1)/(d))
	if (y2 < y1)
	{
	
		phi := -phi
	}


	f := 1/d
	A := d//20
	x_r := 1
	x_old := 0
	y_old := 0
	cos_phi := cos(phi)
	sin_phi := sin(phi)

	
	while (x_r < d)
	{
		y_phi := A * Sin(2 * pi * f * x_r)
		x_n := Round( x_r * cos_phi - y_phi * sin_phi)
		y_n := Round( x_r * sin_phi + y_phi * cos_phi)
		
		
		x_move := x_n - x_old
		y_move := y_n - y_old
		MouseMove, x_move, y_move, Speed, Relative
		

		;MsgBox, x_move = %x_move%, y_move = %y_move%
		
		x_old := x_n		
		y_old := y_n


		
		x_r := x_r + 2
	}

	MouseMove, x2, y2, 1
	

}
