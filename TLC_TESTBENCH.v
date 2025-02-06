module tlc_tb;
  reg clk,rst;
  wire [2:0]north_light,east_light,south_light,west_light;
  
  tlc dut(.clk(clk),
          .rst(rst),
          .north_light(north_light),
          .east_light(east_light),
          .south_light(south_light),
          .west_light(west_light));
  
  always #5 clk=~clk;
  
  initial begin
    $monitor("time=%0t | north_light=%0b | east_light=%0b | south_light=%0b | west_light=%0b",$time,north_light,east_light,south_light,west_light);
    
    clk=0;
    rst=1;
    #10;
    rst=0;
    #600;
    $finish;
  end
  initial begin
    $dumpfile("tlc.vcd");
    $dumpvars(1);
  end
endmodule
