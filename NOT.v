
module bitwiseNOT(a,o);
input a,b;
output o;
not n1(o,a);
endmodule

module bitNOT(a,o);
input [3:0] a;
output [3:0] o;
bitwiseNOT n1(a[0],o[0]);
bitwiseNOT n2(a[1],o[1]);
bitwiseNOT n3(a[2],o[2]);
bitwiseNOT n4(a[3],o[3]);
endmodule

module main;
reg [3:0] a;
wire [3:0] o;
bitNOT n1(a,o);
  initial 
    begin
      $monitor("At time %t, a=%d  \n  o[3]=%d o[2]=%d o[1]=%d o[0]=%d", $time, a, o[3],o[2],o[1],o[0]);
    //a=6
    a[3]=0;a[2]=1;a[1]=1;a[0]=0;
  
    end
endmodule
