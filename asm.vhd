library ieee;
use ieee.std_logic_1164.all;

entity asm is
	Port(Resetn, clock: in std_logic;
			Start, Principiante, Intermedio, Avanzado: in std_logic;
			bombColocadas, ocupado, izq, der, arr, abj, ok, spaceOcupado, ganador: in std_logic;
			enAlex, enAley, selInsBomb, insBomb, enMost, downY, downX, insEspacio, parpadear: out std_logic;
			enX, ldX, enY, ldY, encerarMatBomb, encMatEspacios, enCantBomb: out std_logic;
			ldCantBomb, enDiff, ldDiff, ldEspacio, gana: out std_logic;
			estados: out std_logic_vector(4 downto 0);
			pantini: out std_logic
			);
end asm;

architecture sol of asm is
	type estado is (t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21);
	signal y: estado;
begin
	--transiciones
	Process(Resetn, clock)
	begin
		if Resetn = '0' then y <= t0;
		elsif clock'event and clock = '1' then
			case y is
				when t0 => if start = '1' then y <= t1; end if;
				when t1 => if start = '0' then y <= t2; end if;
				when t2 => if principiante = '1' then y <= t3;
								elsif intermedio = '1' then y<= t4;
								elsif avanzado = '1' then y <= t5; end if;
				when t3 => if principiante = '0' then y <= t7; end if;
				when t4 => if intermedio = '0' then y <= t7; end if;
				when t5 => if avanzado = '0' then y <= t6; end if;
				when t6 => y <= t7;
				when t7 => y <= t8;
				when t8 => y <= t9;
				when t9 => if bombColocadas = '1' then  y <= t10;
								else y <= t7; end if;
				when t10 => if izq = '1' then y <= t11;
								elsif der = '1' then y <= t12;
								elsif arr = '1' then y <= t13;
								elsif abj = '1' then y <= t14;
								elsif ok = '1' then y <= t15; end if;
				when t11 => if izq = '0' then y <= t10; end if;
				when t12 => if der = '0' then y <= t10; end if;
				when t13 => if arr = '0' then y <= t10; end if;
				when t14 => if abj = '0' then y <= t10; end if;
				when t15 => if ok = '0' then y <= t16; end if;
				when t16 => if ocupado = '1' then y <= t17; 
								else y <= t18; end if;
				when t17 => if start = '1' then y <= t19; end if;
				when t18 => if Ganador = '0' then y <= t10; else y <= t20; end if;
				when t19 => if start = '0' then y <= t0; end if;
				when t20 => if start = '1' then y <= t21; end if;
				when t21 => if start = '0' then y <= t0; end if;
			end case;
		end if;	
	end process;
	
	--salidas
	Process(Resetn, clock, intermedio, avanzado, ocupado, izq, der, arr, abj, ocupado, spaceOcupado)
	begin
	enAlex <= '0'; enAley <= '0'; selInsBomb <= '0'; insBomb <= '0'; enMost <= '0'; downY <= '0'; downX <= '0'; insEspacio <= '0'; parpadear <= '0';
	enX <= '0'; ldX <= '0'; enY <= '0'; ldY <= '0'; encerarMatBomb <= '0'; encMatEspacios <= '0'; enCantBomb <= '0';
	ldCantBomb <= '0'; enDiff <= '0'; ldDiff <= '0'; gana <= '0'; estados <= "00000"; LdEspacio <= '0'; pantini <= '0';
	case y is
		when t0 => enX <= '1'; enY <= '1'; ldX <= '1'; ldY <= '1'; encerarMatBomb <= '1'; encMatEspacios <= '1';
					enCantBomb <= '1'; ldCantBomb <= '1'; enDIff <= '1'; ldDiff <= '1'; ldEspacio <= '1'; pantini <= '1'; estados <= "00000";
		when t1 => estados <= "00001";
		when t2 => estados <= "00010"; pantini <= '1';
		when t3 => estados <= "00011";
		when t4 => estados <= "00100"; 
						if intermedio = '0' then enDIff <= '1'; end if;
		when t5 => estados <= "00101"; if avanzado = '0' then enDiff <= '1'; end if;
		when t6 => enDIff <= '1'; estados <= "00110";
		when t7 => enAleX <= '1'; estados <= "00111";
		when t8 => enAleY <= '1'; estados <= "01000";
		when t9 => selInsBomb <= '1'; estados <= "01001";
						if Ocupado = '0' then insBomb <= '1'; enCantBomb <= '1'; end if;
		when t10 => enMost <= '1'; estados <= "01010";
		when t11 => enMost <= '1'; estados <= "01011";
						if izq = '0' then enX <= '1'; downX <= '1'; end if;
		when t12 => enMost <= '1'; estados <= "01100";
						if der = '0' then enX <= '1'; end if;
		when t13 => enMost <= '1'; estados <= "01101";
						if arr = '0' then enY <= '1'; downY <= '1'; end if;
		when t14 => enMost <= '1'; estados <= "01110";
						if abj = '0' then enY <= '1'; end if;
		when t15 => enMost <= '1'; estados <= "01111";
		when t16 => enMost <= '1'; estados <= "10000";
						if ocupado = '0' and spaceOcupado = '0' then insEspacio <= '1'; end if;
		when t17 => parpadear <= '1'; enMost <= '1'; estados <= "10001";
		when t18 => estados <= "10010";
		when t19 => parpadear <= '1'; enMost <= '1'; estados <= "10011";
		when t20 => Gana <= '1'; estados <= "10100";
		when t21 => estados <= "10101";
	end case;
	end process;
end sol;