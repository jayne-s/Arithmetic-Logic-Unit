module mux8to1(f2,f1,f0,fBit,s7,s6,s5,s4,s3,s2,s1,s0);
input f2,f1,f0,s0,s1,s2,s3,s4,s5,s6,s7;
output fBit;
wire f2N,f1N,f0N,w0,w1,w2,w3,w4,w5,w6,w7;
not n1(f0N,f0);
not n2(f1N,f1);
not n3(f2N,f2);
and a0(w0,f2N,f1N,f0N,s0);
and a1(w1,f2N,f1N,f0,s1);
and a2(w2,f2N,f1,f0N,s2);
and a3(w3,f2N,f1,f0,s3);
and a4(w4,f2,f1N,f0N,s4);
and a5(w5,f2,f1N,f0,s5);
and a6(w6,f2,f1,f0N,s6);
and a7(w7,f2,f1,f0,s7);
or o1(fBit,w0,w1,w2,w3,w4,w5,w6,w7);
endmodule

module mux8to1_4bit(f2,f1,f0,fBit,s7,s6,s5,s4,s3,s2,s1,s0);
input [3:0] s0,s1,s2,s3,s4,s5,s6,s7;
input f2,f1,f0;
output [3:0] fBit;

mux8to1 m1(f2,f1,f0,fBit[0],s7[0],s6[0],s5[0],s4[0],s3[0],s2[0],s1[0],s0[0]);
mux8to1 m2(f2,f1,f0,fBit[1],s7[1],s6[1],s5[1],s4[1],s3[1],s2[1],s1[1],s0[1]);
mux8to1 m3(f2,f1,f0,fBit[2],s7[2],s6[2],s5[2],s4[2],s3[2],s2[2],s1[2],s0[2]);
mux8to1 m4(f2,f1,f0,fBit[3],s7[3],s6[3],s5[3],s4[3],s3[3],s2[3],s1[3],s0[3]);
endmodule

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

module bitwiseOR(a,b,o);
input a,b;
output o;
or o1(o,a,b);
endmodule

module bitOR(a,b,o);
input [3:0] a;
input [3:0] b;
output [3:0] o;
bitwiseOR o1(a[0],b[0],o[0]);
bitwiseOR o2(a[1],b[1],o[1]);
bitwiseOR o3(a[2],b[2],o[2]);
bitwiseOR o4(a[3],b[3],o[3]);
endmodule

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

module main;
//mux
reg f2,f1,f0;
reg [3:0] s0,s1,s2,s3,s4,s5,s6,s7;
wire [3:0] fBit;
reg [3:0] a,b;

//and 
wire [3:0] an;
bitAND a1(a,b,an);

//or 
wire [3:0] o;
bitOR o1(a,b,o);

//not
wire [3:0] n;
bitNOT n1(a,n);

//add-sub
wire [3:0] su;
wire cout;
adder4bit add4(a,b,f0,su,cout);

mux8to1_4bit m1(f2,f1,f0,fBit,s7,s6,s5,n,o,an,su,su);

  initial 
    begin
    $monitor("s7=%d s6=%d s5=%d s4=%d s3=%d s2=%d s1=%d s0=%d \n f2=%d f1=%d f0=%d \n fBit=%d", s7,s6,s5,n,o,an,su,su,f2,f1,f0,fBit);
     a=6;b=4;
     f2=0;f1=1;f0=0;
     #1
     f2=0;f1=1;f0=1;
    end
endmodule
