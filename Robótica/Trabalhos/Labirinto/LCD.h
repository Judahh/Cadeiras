#ifndef __LDC
#define __LDC
	void LCD_init(void);
	void LCD_delay_ms (unsigned char time);
	void LCD_pos_xy(char x, char y);
	void LCD_write_char(char c);
	void LCD_write_string (char *c);
	void LCD_write_string_rom (const rom char *c);
	void LCD_display_on(void);
	void LCD_display_off(void);
	void LCD_cursor_on(void);
	void LCD_cursor_off(void);
	void LCD_cursor_blink_on(void);
	void LCD_cursor_blink_off(void);
	void LCD_send_nibble(char data);
	void LCD_send_byte(char address, char data);
	void LCDCmd(unsigned char c);
	void clear(void);
	void LCDChar(unsigned char c);
	void LCD_Welcome (void);
	void Inicio_2Linha (void);
	void LCD_write_string_row (const rom char *c);
	void LCD_write_string2 (char *c,int k);
#endif  //__LCD 