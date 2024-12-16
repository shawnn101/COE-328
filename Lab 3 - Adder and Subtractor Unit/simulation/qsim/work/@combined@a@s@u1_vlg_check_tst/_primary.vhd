library verilog;
use verilog.vl_types.all;
entity CombinedASU1_vlg_check_tst is
    port(
        C_out           : in     vl_logic;
        leds_mag        : in     vl_logic_vector(0 to 6);
        leds_sign       : in     vl_logic_vector(0 to 6);
        OV              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end CombinedASU1_vlg_check_tst;
