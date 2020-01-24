library ieee;
use ieee.std_logic_1164.all;


entity enableSignal is

Port(
	ent: in std_logic_vector(7 downTo 0);
	enable: in std_logic;
	Q: out std_logic_vector(7 downTo 0)
);
end enableSignal;

architecture sol of enableSignal is

begin
 Q(0) <= not(ent(0)) and enable;
 Q(1) <= not(ent(1)) and enable;
 Q(2) <= not(ent(2)) and enable;
 Q(3) <= not(ent(3)) and enable;
 Q(4) <= not(ent(4)) and enable;
 Q(5) <= not(ent(5)) and enable;
 Q(6) <= not(ent(6)) and enable;
 Q(7) <= not(ent(7)) and enable;

end sol;