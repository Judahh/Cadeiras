__var.asm

INT0            EQU	03h	;Endere‡o inicial da INT0
INT1            EQU	13h     ;Endere‡o inicial da INT1
TIMER0          EQU 	0Bh     ;Endere‡o inicial do TIMER0
TIMER1          EQU 	1Bh     ;Endere‡o inicial do TIMER1
SERIAL		EQU	23h	;Endere‡o inicial da SERIAL

CLOCK_ENTRYS	EQU	50	;N§ de ints do TIMER 1 p/contar 1s
CLOCK_COUNTER	EQU	65536 - (11059200/12/CLOCK_ENTRYS)


Year		EQU	08h
Month		EQU 	09h		;Contador de Anos
Day		EQU 	0Ah		;Contador de Meses
DayW		EQU	0Bh		;Contador de Dias
Hours		EQU	0Ch		;Contador de Dias da Semana
Minutes		EQU	0Dh		;Contador de Minutos
Seconds		EQU	0Eh		;Contador de Segundos
MilSeconds	EQU	0Fh		;Contador de milisegundos
Seconds_c       EQU     1Dh             ;Contador de segundos do cronômetro
Minutes_c       EQU     1Eh             ;    "       minutos        "
Hours_c         EQU     1Fh             ;    "       horas          "

OFFSET		EQU	10h
CODIGO_LIDO	EQU	11h
TIMEOUT		EQU	12h
BOUNCE		EQU	13h
meiohertz       EQU     14h
OFFSET_UM       EQU     1Bh
MSG_ERRO        EQU     1Ch
DISPLAY_Er      EQU     BCh
DISPLAY_ro      EQU     CDh
CONTADOR1       EQU     25h             ;Registro das unidades e dezenas do contador de pulsos
CONTADOR2       EQU     26h             ;Registro das centenas e milhares do contador de pulsos
CONTADOR3       EQU     27h             ;Registro das dezenas e centenas de milhares do cont. de pulsos
LARGURA1        EQU     28h             ;Registro das unidades e dezenas do medidor de largura de pulsos
LARGURA2        EQU     29h             ;Registro das centenas e milhares do medidor de largura de pulsos
LARGURA3        EQU     2Ah             ;Registro das dezenas e centenas de milhares do med. de largura de pulsos

BITCTL		REG	20h.0
SearchOK	REG	20h.1
TIMEOUT_B	REG	20h.2
naoatual        REG     20h.3
cronbit         REG     20h.4
cronpto         REG     20h.5
contbit         REG     20h.6

	END
