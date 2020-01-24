library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity matrizEspacios is 
	Port(
		Resetn, clock: in std_logic;
		encerar, colocar: in std_logic;
		posx, posy, addFila: in std_logic_vector(2 downTo 0);
		parpadear, clockParpadea: in std_logic;
		ValueX_Y: out std_logic;
		fila: out std_logic_vector(7 downTo 0)
	);
end matrizEspacios;

architecture sol of matrizEspacios is
	type matriz is array(7 downTo 0) of std_logic_vector(7 downTo 0);
	signal mat: matriz;
	signal px, py, f: integer range 0 to 7;
	signal ftemp: std_logic_vector(7 downTo 0);
begin
-- cambios a la matriz
	Process(Resetn, clock)
	begin
		if Resetn = '0' or encerar = '1' then
			mat(7) <= "00000000"; mat(6) <= "00000000"; mat(5) <= "00000000"; mat(4) <= "00000000";
			mat(3) <= "00000000"; mat(2) <= "00000000"; mat(1) <= "00000000"; mat(0) <= "00000000";
		elsif clock'event and clock = '1' then
			if colocar = '1' then mat(py)(px) <= '1'; end if;
		end if;
	end process;
	
	--no dependiente del clock
	valueX_Y <= mat(py)(px);
	ftemp <= "11111111" when clockParpadea = '1' else "00000000";
	fila <= mat(f) when parpadear = '0' else ftemp;
	
	--maneja las direcciones de los arreglos
	with addFila select
		f <= 0 when "000", 
				1 when "001", 
				2 when "010", 
				3 when "011", 
				4 when "100", 
				5 when "101", 
				6 when "110", 
				7 when "111";
	
	with posx select
		px <= 0 when "000", 
				1 when "001", 
				2 when "010", 
				3 when "011", 
				4 when "100", 
				5 when "101", 
				6 when "110", 
				7 when "111";
		
	with posy select
		py <= 0 when "000", 
				1 when "001", 
				2 when "010", 
				3 when "011", 
				4 when "100", 
				5 when "101", 
				6 when "110", 
				7 when "111";
		
end sol;