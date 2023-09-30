module mux8to1(f2,f1,f0,fBit);
input f2,f1,f0;
output fBit;
wire f2N,f1N,f0N,w0,w1,w2,w3,w4,w5,w6,w7;

not n1(f0N,f0);
not n2(f1N,f1);
not n3(f2N,f2);

and a0(w0,f2N,f1N,f0N,1);
and a1(w1,f2N,f1N,f0,0);
and a2(w2,f2N,f1,f0N,0);
and a3(w3,f2N,f1,f0,1);
and a4(w4,f2,f1N,f0N,1);
and a5(w5,f2,f1N,f0,0);
and a6(w6,f2,f1,f0N,1);
and a7(w7,f2,f1,f0,1);
or o1(fBit,w0,w1,w2,w3,w4,w5,w6,w7);
endmodule

module main;
reg f2,f1,f0;
wire fBit;
mux8to1 m1(f2,f1,f0,fBit);
  initial 
    begin
    $monitor("f2=%d f1=%d f0=%d fBit=%d", f2,f1,f0,fBit);
    f2=1;f1=0;f0=0;
    #1
    f2=0;f1=0;f0=1;
    end
endmodule
