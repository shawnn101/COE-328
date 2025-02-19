LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY sseg_7q3 IS
    PORT (
        bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- BCD digit input
        sign : IN STD_LOGIC;                   -- Sign input (0 = positive, 1 = negative)
        leds_mag : OUT STD_LOGIC_VECTOR(0 TO 6); -- 7-segment output for magnitude
        leds_sign : OUT STD_LOGIC_VECTOR(0 TO 6) -- 7-segment output for sign
    );
END sseg_7q3;

--     6
--     -   
--  1|	|  5
--    0-
--  2|	|  4
--     _
--     3

-- 0000000
-- 1234567


ARCHITECTURE Behavior OF sseg_7q3 IS
BEGIN
    -- Process to handle the BCD to 7-segment conversion for magnitude (right display)
    PROCESS (bcd)
    BEGIN
        CASE bcd IS
         WHEN "0000" => leds_mag <= "0010101"; -- n 
			WHEN "0001" => leds_mag <= "0111011"; -- y
			WHEN OTHERS => leds_mag <= "-------";
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
