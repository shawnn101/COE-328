LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY register7 IS
    PORT (
        A   : IN  std_logic_vector(7 DOWNTO 0); -- 8-bit input A
        res : IN  std_logic;                    -- Reset signal
        clk : IN  std_logic;                    -- Clock signal
        Q   : OUT std_logic_vector(7 DOWNTO 0)  -- 8-bit output Q
    );
END register7;

ARCHITECTURE behavior OF register7 IS
BEGIN
    PROCESS (clk, res)
    BEGIN
        IF res = '1' THEN
            Q <= (OTHERS => '0'); -- Reset the output to "00000000"
        ELSIF (clk'EVENT AND clk = '1') THEN
            Q <= A; -- Transfer input A to output Q on the rising edge of the clock
        END IF;
    END PROCESS;
END behavior;
