module demo3(
input wire clock,
input wire reset,

output reg [6:0] seg_1,
output reg [6:0] seg_2,
output reg [6:0] seg_3,
output reg [6:0] seg_4,
output reg led
);

reg [3:0] sanpham;
reg [3:0] thunghang;


always @(posedge clock or negedge reset) begin
if(~reset) begin
sanpham<=4'b0000;
thunghang<= 4'b0000;
end
else begin
	if(clock)	begin
	if (sanpham == 4'b1010) begin
	sanpham <= 4'b0001;
	thunghang <= thunghang +1;
		end
	else if(sanpham != 4'b1010 && thunghang !=4'b1010)begin
	sanpham <= sanpham+1;end

	end
	end
end
always @(sanpham) begin
    case (sanpham)
        4'b0000: seg_1 = 7'b0000001; // 0
        4'b0001:begin seg_1 = 7'b1001111; seg_2 = 7'b1; end // 1
        4'b0010: seg_1 = 7'b0010010; // 2
        4'b0011: seg_1 = 7'b0000110; // 3
        4'b0100: seg_1 = 7'b1001100; // 4
        4'b0101: seg_1 = 7'b0100100; // 5
        4'b0110: seg_1 = 7'b0100000; // 6
        4'b0111: seg_1 = 7'b0001111; // 7
        4'b1000: seg_1 = 7'b0000000; // 8
        4'b1001: seg_1 = 7'b0000100; // 9
		  4'b1010: begin 
					  seg_1 = 7'b0000001; //0
					  seg_2 = 7'b1001111; end //1
        default:begin seg_1 = 7'b1; seg_2 = 7'b1; end
    endcase
end

always @(thunghang) begin
	
    case (thunghang)
        4'b0000:begin seg_3 = 7'b0000001;seg_4 = 7'b1;end // 0
        4'b0001: seg_3 = 7'b1001111; // 1
        4'b0010: seg_3 = 7'b0010010; // 2
        4'b0011: seg_3 = 7'b0000110; // 3
        4'b0100: seg_3 = 7'b1001100; // 4
        4'b0101: seg_3 = 7'b0100100; // 5
        4'b0110: seg_3 = 7'b0100000; // 6
        4'b0111: seg_3 = 7'b0001111; // 7
        4'b1000: seg_3 = 7'b0000000; // 8
        4'b1001: seg_3 = 7'b0000100; // 9
		  4'b1010: begin 
		           seg_3 = 7'b0000001;
					  seg_4 = 7'b1001111;// 10
					  end
        default: begin seg_3 = 7'b1; seg_4 = 7'b1; end
    endcase
end

always @(thunghang) begin
    case (thunghang)
        4'b1010: led = 1'b1;
        default: led = 1'b0;
    endcase
end



endmodule