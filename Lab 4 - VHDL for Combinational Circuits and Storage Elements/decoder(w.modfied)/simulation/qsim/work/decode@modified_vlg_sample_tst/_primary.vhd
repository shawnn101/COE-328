library verilog;
use verilog.vl_types.all;
entity decodeModified_vlg_sample_tst is
    port(
        En              : in     vl_logic;
        w               : in     vl_logic_vector(1 downto 0);
        w2              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end decodeModified_vlg_sample_tst;
