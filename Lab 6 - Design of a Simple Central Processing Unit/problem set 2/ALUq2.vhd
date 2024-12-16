LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU_unitq2 IS
    PORT (
        clk, res : IN std_logic;
        Reg1, Reg2 : IN unsigned(7 DOWNTO 0); -- 8-bit inputs A & B
        opcode : IN unsigned(15 DOWNTO 0); -- 16-bit opcode

        Result_high : OUT unsigned(3 DOWNTO 0); -- Upper 4 bits of the result
        Result_low : OUT unsigned(3 DOWNTO 0); -- Lower 4 bits of the result
        Negative_high : OUT std_logic; -- Negative indicator for Result_high
        Negative_low : OUT std_logic -- Negative indicator for Result_low
    );
END ALU_unitq2;

ARCHITECTURE calculation OF ALU_unitq2 IS
    SIGNAL Result : unsigned(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk, res)
    BEGIN
        IF (res = '1') THEN
            Result <= (OTHERS => '0');
				
        ELSIF (clk'EVENT AND clk = '1') THEN
		  
            CASE opcode IS
                
					 WHEN "0000000000000001" => -- Function 1: Swap lower and upper 4 bits of Reg1
                    Result(7) <= Reg1(3);
						  Result(6) <= Reg1(2);
						  Result(5) <= Reg1(1);
						  Result(4) <= Reg1(0);
						  Result(3) <= Reg1(7);
						  Result(2) <= Reg1(6);
						  Result(1) <= Reg1(5);
						  Result(0) <= Reg1(4);
                    
                WHEN "0000000000000010" => -- Function 2: OR Reg1 and Reg2
						  Result <= Reg1 OR Reg2;  
						  
                WHEN "0000000000000100" => -- Function 3: Decrement Reg 2 by 5
                    Result <= (Reg2) - 5;
                    
                WHEN "0000000000001000" => -- Function 4: Invert all bits of Reg1
                    Result <= NOT(Reg1);
                    
                WHEN "0000000000010000" => -- Function 5: Invert bit-significance order of Reg1
                    Result(7) <= Reg1(0);
						  Result(6) <= Reg1(1);
						  Result(5) <= Reg1(2);
						  Result(4) <= Reg1(3);
						  Result(3) <= Reg1(4);
						  Result(2) <= Reg1(5);
						  Result(1) <= Reg1(6);
						  Result(0) <= Reg1(7);
                    
                WHEN "0000000000100000" => -- Function 6: Find max(Reg1,Reg2)
                    IF Reg1 >= Reg2 THEN
                        Result <= Reg1;
                    ELSE
                        Result <= Reg2;
                    END IF;
                    
                WHEN "0000000001000000" => -- Function 7: Difference between Reg1 and Reg2
                    IF (Reg2 > Reg1) THEN
                        -- Two's complement subtraction when B > A
                        Result <= (NOT (Reg2 - Reg1)) + 1;
                    ELSE
                        Result <= Reg1 - Reg2;
                    END IF;
                    
                WHEN "0000000010000000" => -- Function 8: XNOR Reg1 and Reg2
                    Result <= NOT (Reg1 XOR Reg2);
					 

                WHEN OTHERS =>
                    Result <= (OTHERS => '0'); -- Default case
            END CASE;
        END IF;
    END PROCESS;

    -- Split Result into high and low 4-bit outputs
    Result_high <= Result(7 DOWNTO 4);
    Result_low <= Result(3 DOWNTO 0);

    -- Determine if high and low parts are negative (MSB of each part is '1')
    Negative_high <= Result(7); -- MSB of the high part
    Negative_low <= Result(3); -- MSB of the low part
END calculation;





















