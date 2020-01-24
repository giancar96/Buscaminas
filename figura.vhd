library ieee;
use ieee.std_logic_1164.all;

entity figura is
	port( sel  : in std_logic_vector(2 downTo 0);
			s : out std_logic_vector(7 downTo 0));
end figura;

Architecture sol of figura is

Begin
	with sel select
		s <= "00000000" when "000",
				"00000000" when "001",
				"00110000" when "010",
				"00111000" when "011",
				"00111100" when "100",
				"00111000" when "101",
				"00110000" when "110",
				"00000000" when others;		
end sol;