LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sseg_dis IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- BCD digit input
        sign : IN STD_LOGIC;                   -- Sign input (0 = positive, 1 = negative)
        leds_mag : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment output for magnitude
        leds_sign : OUT STD_LOGIC_VECTOR(0 TO 6) -- 7-segment output for sign
    );
END sseg_dis;

--     0
--     -   
--  5|	|  1
--    6-
--  4|	|  2
--     _
--     3

-- 0000000
-- 1234567


ARCHITECTURE Behavior OF sseg_dis IS
BEGIN
    -- Process to handle the BCD to 7-segment conversion for magnitude (right display)
    PROCESS (bcd)
    BEGIN
        CASE bcd IS
            -- Magnitude for digits 0-9 (standard BCD)
            WHEN "0000" => leds_mag <= NOT"1111110";  -- 0
            WHEN "0001" => leds_mag <= NOT"0110000";  -- 1
            WHEN "0010" => leds_mag <= NOT"1101101";  -- 2
            WHEN "0011" => leds_mag <= NOT"1111001";  -- 3
            WHEN "0100" => leds_mag <= NOT"0110011";  -- 4
            WHEN "0101" => leds_mag <= NOT"1011011";  -- 5
            WHEN "0110" => leds_mag <= NOT"1011111";  -- 6
            WHEN "0111" => leds_mag <= NOT"1110000";  -- 7
            WHEN "1000" => leds_mag <= NOT"1111111";  -- 8
            WHEN "1001" => leds_mag <= NOT"1110011";  -- 9

            -- For hexadecimal values A-F
            WHEN "1010" => leds_mag <= "1110111";  -- A
            WHEN "1011" => leds_mag <= "0011111";  -- b
            WHEN "1100" => leds_mag <= "1001110";  -- C
            WHEN "1101" => leds_mag <= "0111101";  -- d
            WHEN "1110" => leds_mag <= "1001111";  -- E
            WHEN "1111" => leds_mag <= "1000111";  -- F
            WHEN OTHERS => leds_mag <= "0000000";  -- Blank (all segments off)
        END CASE;
    END PROCESS;

    -- Process to handle the sign display (left display)
    PROCESS (sign)
    BEGIN
        IF sign = '1' THEN
            -- If the number is negative, show the minus sign (middle segment on)
            leds_sign <= "0000001";  -- "-" on the display
        ELSE
            -- If the number is positive, turn off all segments
            leds_sign <= "0000000";  -- No sign (all segments off)
        END IF;
    END PROCESS;

END Behavior;
