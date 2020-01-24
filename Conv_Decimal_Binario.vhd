library ieee;
use ieee.std_logic_1164.all;

Entity Conv_Decimal_Binario is
	Port(
	Ent : in std_logic_vector(7 downTo 0);
	BCD : out std_logic_vector(2 downTo 0));
end Conv_Decimal_Binario;

Architecture sol of Conv_Decimal_Binario is

Begin
	with Ent select
	BCD <="111" when "01111111", 
			"110" when "10111111",
			"101" when "11011111",
			"100" when "11101111",
			"011" when "11110111",
			"010" when "11111011",
			"001" when "11111101",
			"000" when "11111110",
			"000" when others;
end sol;