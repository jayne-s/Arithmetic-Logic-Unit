// Adder/Subtractor Unit

module halfadder(a,b,s,c);
input a,b;
output s,c;
xor x1(s,a,b);
and a1(c,a,b);
endmodule

module full_adder(a,b,cin,s,co);
input a,b,cin;
output s,co;
wire s1,co1,co2;
halfadder ha1(a,b,s1,co1);
halfadder ha2(s1,cin,s,co2);
or o1(co,co1,co2);
endmodule

module adder4bit(a,b,ci,s,co);
input [3:0] a;
input [3:0] b;
input ci;
output [3:0] s;
output co;
wire co1, co2, co3,w1,w2,w3,w4;

xor x1(w1,b[0],ci);
xor x2(w2,b[1],ci);
xor x3(w3,b[2],ci);
xor x4(w4,b[3],ci);
full_adder fa1(a[0], w1, ci, s[0], co1);
full_adder fa2(a[1], w2, co1, s[1], co2);
full_adder fa3(a[2], w3, co2, s[2], co3);
full_adder fa4(a[3], w4, co3, s[3], co);
endmodule

//Testbench

module main;
reg [3:0] a,b;
reg cin;
wire [3:0] su;
wire cout;
adder4bit add4(a,b,cin,su,cout);
  initial 
    begin
    $monitor("At time %t, a=%d b=%d cin=%d \n cout=%d su[3]=%d su[2]=%d su[1]=%d su[0]=%d", $time, a, b, cin, cout, su[3],su[2],su[1],su[0]);
    //6+4=10
    a[3]=0;a[2]=1;a[1]=1;a[0]=0;
    b[3]=0;b[2]=1;b[1]=0;b[0]=0;
    cin=0;
    #1
    //7+9=16
    a[3]=0;a[2]=1;a[1]=1;a[0]=1;
    b[3]=1;b[2]=0;b[1]=0;b[0]=1;
    cin=0;
    #1
    //10-4=6
    a[3]=1;a[2]=0;a[1]=1;a[0]=0;
    b[3]=0;b[2]=1;b[1]=0;b[0]=0;
    cin=1;
    #1
    //7-5=2
    a[3]=0;a[2]=1;a[1]=1;a[0]=1;
    b[3]=0;b[2]=1;b[1]=0;b[0]=1;
    cin=1;
    end
endmodule
