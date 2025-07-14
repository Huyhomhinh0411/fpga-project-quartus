module demLED7doan (
    input wire clk,     
    output reg [6:0] led_7seg  
);

reg [3:0] counter; 

always @(posedge clk) begin
    counter <= counter + 1;
end

always @(posedge clk) begin
    case(counter)
			4'd0: led_7seg = 7'b0000001;
			4'd1: led_7seg = 7'b1001111;
			4'd2: led_7seg = 7'b0010010;
			4'd3: led_7seg = 7'b0000110;
			4'd4: led_7seg = 7'b1001100;
			4'd5: led_7seg = 7'b0100100;
			4'd6: led_7seg = 7'b0100000;
			4'd7: led_7seg = 7'b0001111;
			4'd8: led_7seg = 7'b0000000;
			4'd9: led_7seg = 7'b0000100;
        default: led_7seg = 7'b1111111; 
    endcase
end

endmodule