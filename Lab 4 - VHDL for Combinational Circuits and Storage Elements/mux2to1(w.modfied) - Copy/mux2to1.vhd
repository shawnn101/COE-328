LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY mux21 IS
	PORT (w0, w1 : IN STD_LOGIC;
	s : IN STD_LOGIC;
	f : OUT STD_LOGIC );
	
END mux21;

ARCHITECTURE Behavior OF mux21 IS
BEGIN
	WITH s SELECT
		f<= w0 WHEN '0',
			 w1 WHEN '1';
			 
END Behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE mux21_package IS
	COMPONENT mux
		PORT (w0, w1 			: IN STD_LOGIC;
			s 						: IN STD_LOGIC;
			f 						: OUT STD_LOGIC);
			
END COMPONENT;
END mux21_package;