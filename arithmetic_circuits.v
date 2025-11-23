`timescale 1ns / 1ps

module arithmetic_circuits();
endmodule

module HA(
    output cout,sum,
    input x,y
    );

    xor xor0(sum,x,y);
    and and0(cout,x,y);

endmodule

module FA(
    output cout,sum,
    input x,y,cin
    );
    
    wire cout0,sum0,cout1;
    
    HA ha0(.x(x), .y(y), .cout(cout0), .sum(sum0));
    HA ha1(.x(sum0), .y(cin), .cout(cout1), .sum(sum));
    
    or or0(cout,cout0,cout1);

endmodule

module RCA(
    output cout,
    output [3:0] sum,
    input [3:0] x,y,
    input cin
    );
    
    wire cout0,cout1,cout2;
    
    FA fa0(.x(x[0]), .y(y[0]), .cin(cin), .cout(cout0), .sum(sum[0]));
    FA fa1(.x(x[1]), .y(y[1]), .cin(cout0), .cout(cout1), .sum(sum[1]));
    FA fa2(.x(x[2]), .y(y[2]), .cin(cout1), .cout(cout2), .sum(sum[2]));
    FA fa3(.x(x[3]), .y(y[3]), .cin(cout2), .cout(cout), .sum(sum[3]));
    
endmodule

module parametric_RCA #(parameter SIZE = 8) (
    output cout_RCA,
    output [SIZE-1:0] sum,
    input [SIZE-1:0] x,y,
    input cin);
    
    genvar i;
    
    (*DONT_TOUCH = "yes"*)wire [SIZE-1:0] cout;
    
    assign cout_RCA = cout[SIZE-1];
    
    (*DONT_TOUCH = "yes"*)FA fa0(.x(x[0]), .y(y[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
    
    generate for(i = 1; i < SIZE; i = i + 1) begin
        (*DONT_TOUCH = "yes"*)FA fan(.x(x[i]), .y(y[i]), .cin(cout[i-1]), .cout(cout[i]), .sum(sum[i]));
    end
    endgenerate 
    
endmodule

module CLA #(parameter SIZE = 8) (
    input [SIZE-1:0] x, y,
    input cin,
    output cout,
    output [SIZE-1:0] s
    );

    (*DONT_TOUCH = "yes"*)wire [SIZE-1:0] g, p;
    (*DONT_TOUCH = "yes"*)wire [SIZE:0] c;
    (*DONT_TOUCH = "yes"*)assign c[0] = cin;
    (*DONT_TOUCH = "yes"*)assign cout = c[SIZE];
    
    genvar i;
    generate for (i = 0; i < SIZE; i = i + 1) begin 
        (*DONT_TOUCH = "yes"*)assign g[i] = x[i] & y[i];
        (*DONT_TOUCH = "yes"*)assign p[i] = x[i] ^ y[i];
        (*DONT_TOUCH = "yes"*)assign c[i+1] = g[i] | (p[i] & c[i]);
        (*DONT_TOUCH = "yes"*)assign s[i] = p[i] ^ c[i];
    end
    endgenerate
endmodule

module behavioral_adder #(parameter SIZE = 8) (
    (*DONT_TOUCH = "yes"*)input [SIZE-1:0] x, y,
    (*DONT_TOUCH = "yes"*)output cout,
    (*DONT_TOUCH = "yes"*)output [SIZE-1:0] sum
    );
    
    (*DONT_TOUCH = "yes"*)wire [SIZE:0] newsum;
    
    assign newsum =  x + y;
    
    assign cout = newsum[SIZE];
    assign sum = newsum[SIZE-1:0];
    
endmodule

module Add_Sub(
    input [3:0] A,B,
    input cin, //m
    output [3:0] sum,
    output cout,
    output overflow //v
    );
    
    wire [3:0] s;
    wire [4:0] c;
    
    assign c[0] = cin;
    
    assign s[0] = cin ^ B[0];
    assign s[1] = cin ^ B[1];
    assign s[2] = cin ^ B[2];
    assign s[3] = cin ^ B[3];
    
    FA fa0(.cout(c[1]) ,.sum(sum[0]) ,.x(A[0]), .y(s[0]), .cin(c[0]));
    FA fa1(.cout(c[2]) ,.sum(sum[1]) ,.x(A[1]), .y(s[1]), .cin(c[1]));
    FA fa2(.cout(c[3]) ,.sum(sum[2]) ,.x(A[2]), .y(s[2]), .cin(c[2]));
    FA fa3(.cout(c[4]) ,.sum(sum[3]) ,.x(A[3]), .y(s[3]), .cin(c[3]));
    
     
    
    assign cout = c[4];
    xor(overflow,c[3],cout);

endmodule 