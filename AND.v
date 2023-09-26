
module bitwiseAND(a,b,o);
input a,b;
output o;
and a1(o,a,b);
endmodule

module bitAND(a,b,o);
input [3:0] a;
input [3:0] b;
output [3:0] o;
bitwiseAND a1(a[0],b[0],o[0]);
bitwiseAND a2(a[1],b[1],o[1]);
bitwiseAND a3(a[2],b[2],o[2]);
bitwiseAND a4(a[3],b[3],o[3]);
endmodule

module main;
reg [3:0] a,b;
wire [3:0] o;
bitAND a1(a,b,o);
  initial 
    begin
      $monitor("At time %t, a=%d b=%d  \n  o[3]=%d o[2]=%d o[1]=%d o[0]=%d", $time, a, b, o[3],o[2],o[1],o[0]);
    //a=6,b=4
    a[3]=0;a[2]=1;a[1]=1;a[0]=0;
    b[3]=0;b[2]=1;b[1]=0;b[0]=0;
    end
endmodule
