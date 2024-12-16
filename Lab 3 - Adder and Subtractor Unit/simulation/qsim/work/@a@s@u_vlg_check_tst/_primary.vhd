library verilog;
use verilog.vl_types.all;
entity ASU_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        Overflow        : in     vl_logic;
        S               : in     vl_logic_vector(3 downto 0);
        Sign            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ASU_vlg_check_tst;
