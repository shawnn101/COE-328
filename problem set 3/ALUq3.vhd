LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU_unitq3 IS
    PORT (
        clk, res : IN std_logic;
        Reg1, Reg2: IN unsigned(7 DOWNTO 0); -- 8-bit inputs A & B
		  student_id : IN unsigned (3 DOWNTO 0); 
        opcode : IN unsigned(15 DOWNTO 0); -- 16-bit opcode
        Result_out : OUT unsigned(3 DOWNTO 0)); -- Upper 4 bits of the result
END ALU_unitq3;

ARCHITECTURE calculation OF ALU_unitq3 IS
    SIGNAL Result : unsigned(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk, res)
    BEGIN
        IF (res = '1') THEN
            Result <= (OTHERS => '0');
				
        ELSIF (clk'EVENT AND clk = '1') THEN
		  
            CASE opcode IS
                WHEN "0000000000000001" => 
                    IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  ELSE 
								Result <= "00000000"; -- N
						
						  END IF;
						  
                WHEN "0000000000000010" => 
                    
                    IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  ELSE 
								Result <= "00000000"; -- N
						
						  END IF;
						  	  
                WHEN "0000000000000100" => 
                    IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y, even
						  
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  
						  ELSE 
								Result <= "00000000"; -- N, odd
						
						  END IF;
						  
						 
                WHEN "0000000000001000" => 
                    
						  IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  ELSE 
								Result <= "00000000"; -- N
						
						  END IF;
						    
						  
                WHEN "0000000000010000" => 
                    IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  ELSE 
								Result <= "00000000"; -- N
						
						  END IF;
						    
                WHEN "0000000000100000" => 
                    IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  ELSE 
								Result <= "00000000"; -- N
						
						  END IF;
						    
                WHEN "0000000001000000" => 
                    IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  ELSE 
								Result <= "00000000"; -- N
						
						  END IF;
						   
                WHEN "0000000010000000" => 
                    IF (student_id mod 2) = 0 THEN
								Result <= "00000001"; -- Y
						  ELSIF (student_id = "0000") THEN
								Result <= "00000001"; -- Y, even
						  ELSE 
								Result <= "00000000"; -- N
						
						  END IF;
						  
                WHEN OTHERS =>
                    Result <= (OTHERS => '0'); -- Default case
            END CASE;
        END IF;
    END PROCESS;

 
    Result_out <= Result(3 DOWNTO 0);
END calculation;