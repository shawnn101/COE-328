library verilog;
use verilog.vl_types.all;
entity ASU_vlg_sample_tst is
    port(
        Add_Sub         : in     vl_logic;
        X               : in     vl_logic_vector(3 downto 0);
        Y               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end ASU_vlg_sample_tst;
