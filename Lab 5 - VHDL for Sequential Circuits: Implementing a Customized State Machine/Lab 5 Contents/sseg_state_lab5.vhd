LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sseg_st_moore IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- BCD digit input
        sign : IN STD_LOGIC;                   -- Sign input (0 = positive, 1 = negative)
        leds_mag : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment output for magnitude
        leds_sign : OUT STD_LOGIC_VECTOR(0 TO 6) -- 7-segment output for sign
    );
END sseg_st_moore;

--     0
--     -   
--  5|	|  1
--    6-
--  4|	|  2
--     _
--     3

-- 0000000
-- 1234567


ARCHITECTURE Behavior OF sseg_st_moore IS
BEGIN
    -- Process to handle the BCD to 7-segment conversion for magnitude (right display)
    PROCESS (bcd)
    BEGIN
        CASE bcd IS
            -- Magnitude for digits 0-7 (standard BCD)
            WHEN "000" => leds_mag <= NOT"1111110";  -- 0
            WHEN "001" => leds_mag <= NOT"0110000";  -- 1
            WHEN "010" => leds_mag <= NOT"1101101";  -- 2
            WHEN "011" => leds_mag <= NOT"1111001";  -- 3
            WHEN "100" => leds_mag <= NOT"0110011";  -- 4
            WHEN "101" => leds_mag <= NOT"1011011";  -- 5
            WHEN "110" => leds_mag <= NOT"1011111";  -- 6
            WHEN "111" => leds_mag <= NOT"1110000";  -- 7
				WHEN OTHERS => leds_mag <= "0000000";  -- Blank (all segments off)
        END CASE;
    END PROCESS;

    -- Process to handle the sign display (left display)
    PROCESS (sign)
    BEGIN
        IF sign = '1' THEN
            -- If the number is negative, show the minus sign (middle segment on)
            leds_sign <= NOT"0000001";  -- "-" on the display
        ELSE
            -- If the number is positive, turn off all segments
            leds_sign <= NOT"0000000";  -- No sign (all segments off)
        END IF;
    END PROCESS;

END Behavior;
