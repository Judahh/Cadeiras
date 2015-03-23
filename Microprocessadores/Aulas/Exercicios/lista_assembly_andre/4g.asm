.chip 8051

_sub_routine:
	mov	10h,#98h
	mov	20h,#76h
	mov	30h,#54h
	mov 40h,#23h

	mov	R0,A
	mov B,@R0
	ret
