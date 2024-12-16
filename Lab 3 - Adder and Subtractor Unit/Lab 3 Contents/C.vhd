library IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

-- Entity declaration
entity C is
    Port (
			s : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			L : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end C;

-- Architecture body
architecture Behavioral of C is
begin

    L(0) <= (NOT s(3));

    L(1) <= (s(0) OR (s(1)AND(NOT s(3))) OR ((NOT s(1))AND s(2) AND s(3)));

    L(2) <= (((NOT s(1)) AND (NOT s(2)) AND (NOT s(3))) OR (s(1) AND (NOT s(2)) AND s(3)) OR (s(1) AND s(2) AND (NOT s(3))));

    L(3) <= '0'; 
end Behavioral;
