LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ASU IS
  PORT (
    Add_Sub : IN STD_LOGIC;                      -- Add/Subtract control (0 for addition, 1 for subtraction)
    X, Y    : IN STD_LOGIC_VECTOR(3 DOWNTO 0);   -- 4-bit inputs
    S       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);  -- 4-bit sum/difference output
    Cout    : OUT STD_LOGIC;                     -- Carry out
    Overflow: OUT STD_LOGIC;                     -- Overflow flag
    Sign     : OUT STD_LOGIC                      -- Sign output (1 for negative, 0 for positive)
  );
END ASU;

ARCHITECTURE Behavior OF ASU IS
  SIGNAL Sum     : STD_LOGIC_VECTOR(4 DOWNTO 0); -- 5-bit result to store carry out
  SIGNAL Y_mod   : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Modified Y for subtraction
  SIGNAL C_in    : STD_LOGIC;                    -- Adjusted carry-in for subtraction
BEGIN
  -- Invert Y if subtracting (Add_Sub = '1') and adjust Cin
  Y_mod <= Y XOR (Add_Sub & Add_Sub & Add_Sub & Add_Sub);  -- XOR with Add_Sub to invert Y if Add_Sub = 1
  C_in  <= Add_Sub;  -- Set Cin to 1 for subtraction to complete two's complement operation

  -- Perform the addition/subtraction operation
  Sum <= ('0' & X) + ('0' & Y_mod) + C_in;

  -- Output the lower 4 bits for the result and carry
  S <= Sum(3 DOWNTO 0);  -- Lower 4 bits for the result
  Cout <= Sum(4);        -- Carry out

  -- Overflow detection: Check if sign changes unexpectedly
  Overflow <= (X(3) XOR Y_mod(3)) AND NOT (X(3) XOR Sum(3));

  -- Sign output: Set Sign to '1' if the result is negative
  Sign <= Sum(3);  -- The sign bit of the result (most significant bit of Sum)

END Behavior;
