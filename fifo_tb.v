module fifo_tb;
reg [7:0]data_in;
reg clk=0;
reg rst,we,re;
wire full,empty,half;
wire [7:0]data_out;
integer i;

fifo dut(.data_in(data_in),.clk(clk),.rst(rst),.we(we),.re(re),.full(full),.empty(empty),.half(half),.data_out(data_out));

initial
begin
forever #5 clk=~clk;
end

initial
begin
rst=1;
end

initial
begin
for(i=0;i<8;i=i+1)begin
#10 rst<=0;we<=1;re<=0;data_in<=$random;
end
#1 rst<=0;we<=0;re<=1;
#100 $stop;
end
endmodule

