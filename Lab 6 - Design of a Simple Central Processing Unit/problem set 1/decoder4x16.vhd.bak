LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec4x9 IS
PORT (
    w : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit input
    En : IN STD_LOGIC;                   -- Enable input
    y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- 16-bit output
);
END dec4x9;

ARCHITECTURE Behavior OF dec4x9 IS

SIGNAL Enw : STD_LOGIC_VECTOR(4 DOWNTO 0) ;

BEGIN
	Enw <= En & w ;
	WITH Enw SELECT
        y <= 
				 "0000000000000000" WHEN "10000", -- Decode for 0000
				 "0000000000000001" WHEN "10001", -- Decode for 0001
             "0000000000000010" WHEN "10010", -- Decode for 0010
             "0000000000000100" WHEN "10011", -- Decode for 0011
             "0000000000001000" WHEN "10100", -- Decode for 0100
             "0000000000010000" WHEN "10101", -- Decode for 0101
             "0000000000100000" WHEN "10110", -- Decode for 0110
             "0000000001000000" WHEN "10111", -- Decode for 0111
             "0000000010000000" WHEN "11000", -- Decode for 1000
             "0000000000000000" WHEN OTHERS;  -- Default case
END Behavior;