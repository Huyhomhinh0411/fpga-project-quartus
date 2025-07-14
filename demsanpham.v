module demsanpham (
  input wire clk,
  input wire rst, // Active-low reset
  output reg [6:0] seg_1,
  output reg [6:0] seg_2,
  output reg [6:0] seg_3,
  output reg [6:0] seg_4,
  output wire led
);

  reg [3:0] san_pham;
  reg [3:0] thung_hang;

  // Đèn LED bật khi đủ 9 thùng
  assign led = (thung_hang == 4'b1001);

  // Đếm sản phẩm và thùng hàng
  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      san_pham   <= 4'b0000;
      thung_hang <= 4'b0000;
    end else begin
      if (san_pham == 4'b1010) begin // 10 sản phẩm → tăng thùng
        san_pham   <= 4'b0001;
        thung_hang <= thung_hang + 1;
      end else if (san_pham != 4'b1010 && thung_hang != 4'b1010) begin
        san_pham <= san_pham + 1;
      end

      if (san_pham == 4'b1010 && thung_hang == 4'b1001) begin
        san_pham <= 4'b0000;
      end
    end
  end

  // Hiển thị số sản phẩm
  always @(san_pham) begin
    case (san_pham)
      4'd0 : begin seg_1 = 7'b0000001; seg_2 = 7'b1111111; end // 0
      4'd1 : begin seg_1 = 7'b1001111; seg_2 = 7'b1111111; end // 1
      4'd2 : begin seg_1 = 7'b0010010; seg_2 = 7'b1111111; end // 2
      4'd3 : begin seg_1 = 7'b0000110; seg_2 = 7'b1111111; end // 3
      4'd4 : begin seg_1 = 7'b1001100; seg_2 = 7'b1111111; end // 4
      4'd5 : begin seg_1 = 7'b0100100; seg_2 = 7'b1111111; end // 5
      4'd6 : begin seg_1 = 7'b0100000; seg_2 = 7'b1111111; end // 6
      4'd7 : begin seg_1 = 7'b0001111; seg_2 = 7'b1111111; end // 7
      4'd8 : begin seg_1 = 7'b0000000; seg_2 = 7'b1111111; end // 8
      4'd9 : begin seg_1 = 7'b0000100; seg_2 = 7'b1111111; end // 9
      4'd10: begin seg_1 = 7'b0000001; seg_2 = 7'b1001111; end // 10 → hiển thị 01
      default: begin seg_1 = 7'b1111111; seg_2 = 7'b1111111; end
    endcase
  end

  // Hiển thị số thùng hàng
  always @(thung_hang) begin
    case (thung_hang)
      4'd0 : begin seg_3 = 7'b0000001; seg_4 = 7'b1111111; end // 0
      4'd1 : begin seg_3 = 7'b1001111; seg_4 = 7'b1111111; end // 1
      4'd2 : begin seg_3 = 7'b0010010; seg_4 = 7'b1111111; end // 2
      4'd3 : begin seg_3 = 7'b0000110; seg_4 = 7'b1111111; end // 3
      4'd4 : begin seg_3 = 7'b1001100; seg_4 = 7'b1111111; end // 4
      4'd5 : begin seg_3 = 7'b0100100; seg_4 = 7'b1111111; end // 5
      4'd6 : begin seg_3 = 7'b0100000; seg_4 = 7'b1111111; end // 6
      4'd7 : begin seg_3 = 7'b0001111; seg_4 = 7'b1111111; end // 7
      4'd8 : begin seg_3 = 7'b0000000; seg_4 = 7'b1111111; end // 8
      4'd9 : begin seg_3 = 7'b0000100; seg_4 = 7'b1111111; end // 9
      default: begin seg_3 = 7'b1111111; seg_4 = 7'b1111111; end
    endcase
  end

endmodule
