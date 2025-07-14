library verilog;
use verilog.vl_types.all;
entity congAND is
    port(
        pin_name1       : out    vl_logic;
        in1             : in     vl_logic;
        in2             : in     vl_logic
    );
end congAND;
