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

module main;
reg f2,f1,f0;
reg [3:0] s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7;
wire [3:0] fBit;
mux8to1_4bit m1(f2,f1,f0,fBit,s7,s6,s5,s4,s3,s2,s1,s0);
  initial 
    begin
    $monitor("s0 = %d s1 = %d s2 = %d s3 = %d s4 = %d s5 = %d s6 = %d s7 = %d, f2 = %d f1 = %d f0 = %d, fBit = %d",s0,s1,s2,s3,s4,s5,s6,s7,f2,f1,f0,fBit);
     f2=0;f1=0;f0=0;
     #1
     f2=0;f1=1;f0=1;
    end
endmodule
