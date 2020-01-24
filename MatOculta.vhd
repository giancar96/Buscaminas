library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MatOculta is 
	Port(
		Resetn, clock: in std_logic;
		encerar, colocar: in std_logic;
		posx, posy: in std_logic_vector(2 downTo 0);
		ocupado, arriba, abajo, izquierda, derecha: out std_logic
	);
end MatOculta;

architecture sol of MatOculta is
	type matriz is array(7 downTo 0) of std_logic_vector(7 downTo 0);
	signal mat: matriz;
	signal px, py, pxIzq, pxDer, pyUp, pyDown: integer range 0 to 7;
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
		
	PXizq <= px+1;
	pxDer <= px-1;
	
	pyUp <= py+1;
	pyDown <= py-1;
	
	ocupado <= mat(py)(px);
	arriba <= '0' when (py = 7) else mat(pyUp)(px);
	abajo <= '0' when (py = 0) else mat(pyDown)(px);
	izquierda <= '0' when (px = 7) else mat(py)(pxIzq);
	Derecha <= '0' when (px = 0) else mat(py)(pxDer);
	
	with posy select
		py <= 0 when "000", 
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
		

		
end sol;