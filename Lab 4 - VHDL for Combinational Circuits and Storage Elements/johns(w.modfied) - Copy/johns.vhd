LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Johns IS
PORT (Clrn, En, Clkn : IN STD_LOGIC; --En = Enable for condtional updating instead of every clock cycle (@ clk = 1), Clrn = Reset
	W : out std_logic_vector(3 DOWNTO 0);
	Q : OUT STD_LOGIC_VECTOR (0 TO 2));
END johns;

ARCHITECTURE Behavior OF Johns IS
signal Qreg : STD_LOGIC_VECTOR (0 TO 2);
BEGIN
	PROCESS (Clrn, Clkn)
	 BEGIN
		IF Clrn = '0' THEN
			Qreg <= "000";
		ELSIF (Clkn'EVENT AND Clkn = '0') THEN
			IF En = '1' THEN
				 Qreg(0) <= not(Qreg(2));
				 Qreg(1) <= Qreg(0);
				 Qreg(2) <= Qreg(1);			 				 
			ELSE
				Qreg <= Qreg;
			END IF;
		END IF;


-- 501[234707]
		CASE Qreg IS
			WHEN "100" =>--0
				W <= "0010"; --4 = 2
			WHEN "110" =>--1
				W <= "0011"; --5 = 3
			WHEN "111" =>--2
				W <= "0100"; --6 = 4
			WHEN "011" =>--3
				W <= "0111"; --7 = 7
			WHEN "001" =>--4
				W <= "0000"; --8 = 0
			WHEN "000" =>--5
				W <= "0111"; --9 = 7
			WHEN OTHERS => W <= "----";--throw error
		END CASE;
	END PROCESS;
Q <= Qreg;
END Behavior;