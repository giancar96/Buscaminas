library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Matriz2 is 
	Port(		
		arriba, abajo, izquierda, derecha: in std_logic;
		posX, posY, NFila: in std_logic_vector(2 downTo 0);
		Q: out std_logic_vector(7 downTo 0)
	);
end Matriz2;

architecture sol of Matriz2 is
	signal posUp, posDown: std_logic_vector(2 downTo 0);
	signal pIzq, pDer, px: integer range 0 to 7;
	signal Qt,Qizq, Qder, Qnext, Up, Down, t1, t2: std_logic_vector(7 downTo 0);
	
begin
	posUp <= posY+1;
	posDown <= posY-1;
	
	
	
	QDer(7) <= derecha when pDer = 7 else '0';
	QDer(6) <= derecha when pDer = 6 else '0';
	QDer(5) <= derecha when pDer = 5 else '0';
	QDer(4) <= derecha when pDer = 4 else '0';
	QDer(3) <= derecha when pDer = 3 else '0';
	QDer(2) <= derecha when pDer = 2 else '0';
	QDer(1) <= derecha when pDer = 1 else '0';
	QDer(0) <= derecha when pDer = 0 else '0';
	
	Qt(0) <= Qizq(0) or QDer(0);
	Qt(1) <= Qizq(1) or QDer(1);
	Qt(2) <= Qizq(2) or QDer(2);
	Qt(3) <= Qizq(3) or QDer(3);
	Qt(4) <= Qizq(4) or QDer(4);
	Qt(5) <= Qizq(5) or QDer(5);
	Qt(6) <= Qizq(6) or QDer(6);
	Qt(7) <= Qizq(7) or QDer(7);
	
	QNext(0) <= '1' when pX = 0 else '0';
	QNext(1) <= '1' when pX = 1 else '0';
	QNext(2) <= '1' when pX = 2 else '0';
	QNext(3) <= '1' when pX = 3 else '0';
	QNext(4) <= '1' when pX = 4 else '0';
	QNext(5) <= '1' when pX = 5 else '0';
	QNext(6) <= '1' when pX = 6 else '0';
	QNext(7) <= '1' when pX = 7 else '0';
	
	
	QIzq(7) <= izquierda when pIzq = 7 else '0';
	QIzq(6) <= izquierda when pIzq = 6 else '0';
	QIzq(5) <= izquierda when pIzq = 5 else '0';
	QIzq(4) <= izquierda when pIzq = 4 else '0';
	QIzq(3) <= izquierda when pIzq = 3 else '0';
	QIzq(2) <= izquierda when pIzq = 2 else '0';
	QIzq(1) <= izquierda when pIzq = 1 else '0';
	QIzq(0) <= izquierda when pIzq = 0 else '0';
	
	Up <= QNext when arriba = '1' else "00000000";
	Down <= QNext when abajo = '1' else "00000000";
	
	Q <= Qt when Nfila = posY else t1;
	t1 <= Up when Nfila = posUp else t2;
	t2 <= Down when Nfila = posDown else "00000000";
	
	

	with posX select
		pX <= 0 when "000", 
				1 when "001", 
				2 when "010", 
				3 when "011", 
				4 when "100", 
				5 when "101", 
				6 when "110", 
				7 when "111";
	
	pIzq <= px + 1;
	pDer <= px - 1;
end sol;