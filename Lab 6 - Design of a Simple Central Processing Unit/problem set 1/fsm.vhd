-- FSM 
-- STUDENT ID : 5[01242415]

library ieee;
use ieee.std_logic_1164.all;

entity fsm7 is
    port (
        clk, dat_in, res : in std_logic;
        stu_id           : out std_logic_vector(3 downto 0);
        curr_state       : out std_logic_vector(3 downto 0)
    );
end entity fsm7;

architecture fsm of fsm7 is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
    signal yfsm : state_type;
begin
    -- Process for handling state transitions
    process (clk, res)
    begin
		  
        if res = '1' then
            yfsm <= s8;
					
        elsif (clk'EVENT AND clk = '1') then
            case yfsm is
                when s8 =>
                    if dat_in = '1' then
                        yfsm <= s0; 
                    else
                        yfsm <= s8;
                    end if;
                when s0 =>
                    if dat_in = '1' then
                        yfsm <= s1; 
                    else
                        yfsm <= s0;
                    end if;
                when s1 =>
                    if dat_in = '1' then
                        yfsm <= s2; 
                    else
                        yfsm <= s1;
                    end if;
                when s2 =>
                    if dat_in = '1' then
                        yfsm <= s3; 
                    else
                        yfsm <= s2;
                    end if;
                when s3 =>
                    if dat_in = '1' then
                        yfsm <= s4; 
                    else
                        yfsm <= s3;
                    end if;
                when s4=>
                    if dat_in = '1' then
                        yfsm <= s5; 
                    else
                        yfsm <= s4;
                    end if;
                when s5=>
                    if dat_in = '1' then
                        yfsm <= s6; 
                    else
                        yfsm <= s5;
                    end if;
                when s6=>
                    if dat_in = '1' then
                        yfsm <= s7; 
                    else
                        yfsm <= s6;
						  end if;
					 when s7=>
                    if dat_in = '1' then
                        yfsm <= s8; 
                    else
                        yfsm <= s7;
                    end if;
						  
                when others =>
                    yfsm <= s8;
            end case;
        end if;
    end process;

    -- Process for setting the stu_id output based on the current state and dat_in
    process (yfsm, dat_in)
    begin
	 -- STUDENT ID : 5[01242415]
        case yfsm is
            when s0 =>
                if dat_in = '1' then
                    stu_id <= "0000"; -- 0
                else
                    stu_id <= "0000";
                end if;
            when s1 =>
                if dat_in = '1' then
                    stu_id <= "0001"; -- 1
                else
                    stu_id <= "0000";
                end if;
            when s2 =>
                if dat_in = '1' then
                    stu_id <= "0010"; -- 2
                else
                    stu_id <= "0001";
                end if;
            when s3 =>
                if dat_in = '1' then
                    stu_id <= "0100"; --4
                else
                    stu_id <= "0010";
                end if;
            when s4 =>
                if dat_in = '1' then
                    stu_id <= "0010"; --2
                else
                    stu_id <= "0100";
                end if;
            when s5 =>
                if dat_in = '1' then
                    stu_id <= "0100"; -- 4
                else
                    stu_id <= "0010";
                end if;
            when s6 =>
                if dat_in = '1' then
                    stu_id <= "0001"; -- 1
                else
                    stu_id <= "0100";
                end if;
            when s7 =>
                if dat_in = '1' then
                    stu_id <= "0101";  -- 5
                else
                    stu_id <= "0001";
                end if;
            when others =>
                stu_id <= "0000";
        end case;
    end process;

    -- Process for setting the curr_state output based on the current state
    process (yfsm)
    begin
        case yfsm is
		      when s8 => curr_state <= "0000";
            when s0 => curr_state <= "0001";
            when s1 => curr_state <= "0010";
            when s2 => curr_state <= "0011";
            when s3 => curr_state <= "0100";
            when s4 => curr_state <= "0101";
            when s5 => curr_state <= "0110";
            when s6 => curr_state <= "0111";
            when s7 => curr_state <= "1000";
            when others => curr_state <= "0000";
        end case;
    end process;
end architecture fsm;