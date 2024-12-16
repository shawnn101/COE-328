library verilog;
use verilog.vl_types.all;
entity CombinedASU1 is
    port(
        C_out           : out    vl_logic;
        Add_Sub         : in     vl_logic;
        X               : in     vl_logic_vector(3 downto 0);
        Y               : in     vl_logic_vector(3 downto 0);
        OV              : out    vl_logic;
        leds_mag        : out    vl_logic_vector(0 to 6);
        leds_sign       : out    vl_logic_vector(0 to 6)
    );
end CombinedASU1;
