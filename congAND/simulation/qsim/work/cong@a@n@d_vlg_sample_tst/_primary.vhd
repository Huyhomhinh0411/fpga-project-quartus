library verilog;
use verilog.vl_types.all;
entity congAND_vlg_sample_tst is
    port(
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end congAND_vlg_sample_tst;
