library verilog;
use verilog.vl_types.all;
entity decodeModified_vlg_check_tst is
    port(
        y1              : in     vl_logic_vector(0 to 3);
        y2              : in     vl_logic_vector(0 to 3);
        sampler_rx      : in     vl_logic
    );
end decodeModified_vlg_check_tst;
