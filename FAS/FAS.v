`include "FIR.v"
`include "SIPO.v"
`include "FFT.v"
`include "FFT2.v"
`include "Analysis.v"


module  FAS (data_valid, data, clk, rst, fir_d, fir_valid, fft_valid, done, freq,
 fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8,
 fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0);
input clk, rst;
input data_valid;
input [15:0] data; 

output fir_valid, fft_valid;
output [15:0] fir_d;
output [31:0] fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8;
output [31:0] fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0;
output done;
output [3:0] freq;

`include "./dat/FIR_coefficient.dat"

  wire [15:0] fir_d_para0, fir_d_para1, fir_d_para2, fir_d_para3, fir_d_para4,fir_d_para5, fir_d_para6, fir_d_para7, fir_d_para8, fir_d_para9, fir_d_para10, 
              fir_d_para11, fir_d_para12, fir_d_para13, fir_d_para14, fir_d_para15;
  wire fir_para_valid;

  FIR fir(
    .clk(clk),
    .rst(rst),
    .data(data),
    .data_valid(data_valid),
 
    .fir_d(fir_d),
    .fir_valid(fir_valid)
    );
  SIPO SIPO( 
    .clk(clk),
    .rst(rst),
    .fir_d(fir_d),
    .fir_valid(fir_valid),
  
    .fir_d_para0(fir_d_para0),
    .fir_d_para1(fir_d_para1),
    .fir_d_para2(fir_d_para2),
    .fir_d_para3(fir_d_para3),
    .fir_d_para4(fir_d_para4),
    .fir_d_para5(fir_d_para5),
    .fir_d_para6(fir_d_para6),
    .fir_d_para7(fir_d_para7),
    .fir_d_para8(fir_d_para8),
    .fir_d_para9(fir_d_para9),
    .fir_d_para10(fir_d_para10),
    .fir_d_para11(fir_d_para11),
    .fir_d_para12(fir_d_para12),
    .fir_d_para13(fir_d_para13),
    .fir_d_para14(fir_d_para14),
    .fir_d_para15(fir_d_para15),
    .fir_para_valid(fir_para_valid)
    );      
    
  FFT fft( 
    .clk(clk),
    .rst(rst),
    .fir_d_para0(fir_d_para0),
    .fir_d_para1(fir_d_para1),
    .fir_d_para2(fir_d_para2),
    .fir_d_para3(fir_d_para3),
    .fir_d_para4(fir_d_para4),
    .fir_d_para5(fir_d_para5),
    .fir_d_para6(fir_d_para6),
    .fir_d_para7(fir_d_para7),
    .fir_d_para8(fir_d_para8),
    .fir_d_para9(fir_d_para9),
    .fir_d_para10(fir_d_para10),
    .fir_d_para11(fir_d_para11),
    .fir_d_para12(fir_d_para12),
    .fir_d_para13(fir_d_para13),
    .fir_d_para14(fir_d_para14),
    .fir_d_para15(fir_d_para15),
    .fir_para_valid(fir_para_valid),
      
    .fft_d1(fft_d1), .fft_d2(fft_d2), .fft_d3(fft_d3), .fft_d4(fft_d4), .fft_d5(fft_d5), .fft_d6(fft_d6), .fft_d7(fft_d7), .fft_d8(fft_d8),
    .fft_d9(fft_d9), .fft_d10(fft_d10), .fft_d11(fft_d11), .fft_d12(fft_d12), .fft_d13(fft_d13), .fft_d14(fft_d14), .fft_d15(fft_d15), .fft_d0(fft_d0),
    .fft_valid(fft_valid)
    );
  Analysis anl(
    .clk(clk),
    .rst(rst),
    .fft_d1(fft_d1), .fft_d2(fft_d2), .fft_d3(fft_d3), .fft_d4(fft_d4), .fft_d5(fft_d5), .fft_d6(fft_d6), .fft_d7(fft_d7), .fft_d8(fft_d8),
    .fft_d9(fft_d9), .fft_d10(fft_d10), .fft_d11(fft_d11), .fft_d12(fft_d12), .fft_d13(fft_d13), .fft_d14(fft_d14), .fft_d15(fft_d15), .fft_d0(fft_d0),
    .fft_valid(fft_valid),
    
    .done(done),
    .freq(freq)
  );  
  

endmodule
