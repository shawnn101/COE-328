LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU_unit7 IS
    PORT (
        clk, res : IN std_logic;
        Reg1, Reg2 : IN unsigned(7 DOWNTO 0); -- 8-bit inputs A & B
        opcode : IN unsigned(15 DOWNTO 0); -- 16-bit opcode
        Result_high : OUT unsigned(3 DOWNTO 0); -- Upper 4 bits of the result
        Result_low : OUT unsigned(3 DOWNTO 0); -- Lower 4 bits of the result
        Negative_high : OUT std_logic; -- Negative indicator for Result_high
        Negative_low : OUT std_logic -- Negative indicator for Result_low
    );
END ALU_unit7;

ARCHITECTURE calculation OF ALU_unit7 IS
    SIGNAL Result: unsigned(7 DOWNTO 0);
BEGIN
    PROCESS (clk, res)
    BEGIN
        IF (rising_edge(clk)) THEN
            IF res = '1' THEN
                Result <= "00000000";
            ELSE
                CASE opcode IS
                    WHEN "0000000000000001" => -- Addition
                        Result <= Reg1 + Reg2;
                    
                    WHEN "0000000000000010" => -- Subtraction
                        IF (Reg2 > Reg1) THEN
                            -- Two's complement subtraction when B > A
                            Result <= (NOT (Reg2 - Reg1)) + 1;
                        ELSE
                            Result <= Reg1 - Reg2;
                        END IF;
                    
                    WHEN "0000000000000100" => -- Inverse (Bitwise NOT)
                        Result <= NOT Reg1;
                    
                    WHEN "0000000000001000" => -- Boolean NAND
                        Result <= NOT (Reg1 AND Reg2);
                    
                    WHEN "0000000000010000" => -- Boolean NOR
                        Result <= NOT (Reg1 OR Reg2);
                    
                    WHEN "0000000000100000" => -- Boolean AND
                        Result <= Reg1 AND Reg2;
                    
                    WHEN "0000000001000000" => -- Boolean XOR
                        Result <= Reg1 XOR Reg2;
                    
                    WHEN "0000000010000000" => -- Boolean OR
                        Result <= Reg1 OR Reg2;
                    
                    WHEN OTHERS => -- Default case for unspecified opcodes
                        Result <=  "00000000"; -- Set to zero or handle as needed
                END CASE;
            END IF;
        END IF;
    END PROCESS;

    -- Split Result into high and low 4-bit outputs
    Result_high <= Result(7 DOWNTO 4);
    Result_low <= Result(3 DOWNTO 0);

    -- Determine if high and low parts are negative (MSB of each part is '1')
    Negative_high <= Result(7); -- MSB of the high part
    Negative_low <= Result(3); -- MSB of the low part
END calculation;