module fullaader(a,b,cin,sum,cout);
input a,b,cin;
output wire sum,cout;
wire s1,c1,c2,c3;
xor(s1,a,b);
xor(sum,s1,cin);
and(c1,a,b);
and(c2,b,cin);
and(c3,a,cin);
or(cout,c1,c2,c3);
endmodule