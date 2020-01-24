library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity sumador5 is 
	generic( n: integer :=4);
	port(	a,b,c,d,e: in std_logic_vector(n-1 downto 0);
			s: out std_logic_vector(n-1 downto 0));
			
end sumador5;
architecture comp of sumador5 is 
	begin 
		s <= a+b+c+d+e;
   end comp;		
		