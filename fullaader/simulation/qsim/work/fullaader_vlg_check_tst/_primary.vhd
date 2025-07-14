library verilog;
use verilog.vl_types.all;
entity fullaader_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        sum             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end fullaader_vlg_check_tst;
