module fifo(clk,rst,data_in,we,re,data_out,full,empty,half);

input [7:0]data_in;

output reg [7:0]data_out;
input clk,rst,re,we;
output reg full,empty,half;
reg [7:0]fifo[7:0];
reg [2:0]read_ptr,write_ptr;


always @(posedge clk )begin
if(rst)begin
data_out<=0;
read_ptr<=0;
write_ptr<=0;
empty<=1;
end
else
empty<=0;
end

always @(posedge clk )begin
if(we && (!full))
begin
fifo[write_ptr]<=data_in;
write_ptr=write_ptr+1;
end
end

always @(posedge clk)begin
if(re && (!empty))begin
data_out<=fifo[read_ptr];
read_ptr=read_ptr+1;
end
end

always @(posedge clk )begin
if(write_ptr==0)begin
empty<=1;
full<=0;
half<=0;
end
else if(write_ptr==3'b111)begin
full<=1;
empty<=0;
half<=0;
end
else
begin
full<=0;
empty<=0;
half<=1;
end
end
endmodule
