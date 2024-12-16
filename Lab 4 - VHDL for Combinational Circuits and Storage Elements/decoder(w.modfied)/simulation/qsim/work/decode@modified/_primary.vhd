library verilog;
use verilog.vl_types.all;
entity decodeModified is
    port(
        y1              : out    vl_logic_vector(0 to 3);
        w2              : in     vl_logic;
        En              : in     vl_logic;
        w               : in     vl_logic_vector(1 downto 0);
        y2              : out    vl_logic_vector(0 to 3)
    );
end decodeModified;
