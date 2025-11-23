`timescale 1ns / 1ps

module arithmetic_circuits_tb();
endmodule

module HA_tb();

    reg x,y;
    wire cout,sum;
   
    
    HA uut(.x(x), .y(y), .cout(cout), .sum(sum));
    
    initial begin
    
        x = 1'b0; y = 1'b0; #10;
        x = 1'b0; y = 1'b1; #10;
        x = 1'b1; y = 1'b0; #10;
        x = 1'b1; y = 1'b1; #10;
        
        $finish();
    end
    
endmodule

module FA_tb();

    reg x,y,cin;
    wire cout,sum;
   
    
    FA uut(.x(x), .y(y), .cin(cin), .cout(cout), .sum(sum));
    
    initial begin
    
        cin = 1'b0; y = 1'b0; x = 1'b0; #10;
        cin = 1'b0; y = 1'b0; x = 1'b1; #10;
        cin = 1'b0; y = 1'b1; x = 1'b0; #10;
        cin = 1'b0; y = 1'b1; x = 1'b1; #10;
        
        cin = 1'b1; y = 1'b0; x = 1'b0; #10;
        cin = 1'b1; y = 1'b0; x = 1'b1; #10;
        cin = 1'b1; y = 1'b1; x = 1'b0; #10;
        cin = 1'b1; y = 1'b1; x = 1'b1; #10;
        
        $finish();
    end
    
endmodule

module RCA_tb();
    reg [3:0] x,y;
    reg cin;
    wire cout;
    wire [3:0] sum;
    
    RCA uut(.x(x),.y(y),.cin(cin),.sum(sum),.cout(cout));
    
    initial begin
    
        cin = 0; x = 255; y=255; #10;
        cin = 0; x = 211; y=120; #10;
        cin = 0; x = 6; y=7; #10;
        cin = 0; x = 100; y=12; #10;
        cin = 0; x = 30; y=9; #10;
        cin = 0; x = 121; y=15; #10;
        cin = 0; x = 11; y=12; #10;
     
        $finish();
     
     end     
endmodule


module parametric_RCA_tb();
    parameter SIZE = 8;
    wire cout_RCA;
    wire [SIZE-1:0] sum;
    reg [SIZE-1:0] x,y;
    reg  cin;
    
    parametric_RCA uut(.x(x),.y(y),.cin(cin),.sum(sum),.cout_RCA(cout_RCA));
    
    initial begin
        cin = 0; x = 255; y=255; #10;
        cin = 0; x = 211; y=120; #10;
        cin = 0; x = 6; y=7; #10;
        cin = 0; x = 100; y=12; #10;
        cin = 0; x = 30; y=9; #10;
        cin = 0; x = 121; y=15; #10;
        cin = 0; x = 11; y=12; #10;
        
        $finish();
     end     
endmodule

module CLA_tb();
    parameter SIZE = 8;
    wire cout;
    wire [SIZE-1:0] s;
    reg [SIZE-1:0] x,y;
    reg  cin;
     
    CLA uut( .x(x), .y(y), .cin(cin), .s(s), .cout(cout));
    
    initial begin
        cin = 0; x = 255; y=255; #10;
        cin = 0; x = 211; y=120; #10;
        cin = 0; x = 6; y=7; #10;
        cin = 0; x = 100; y=12; #10;
        cin = 0; x = 30; y=9; #10;
        cin = 0; x = 121; y=15; #10;
        cin = 0; x = 11; y=12; #10;
     
        $finish();
     
     end     
endmodule

module behavioral_adder_tb();
    parameter SIZE = 8;
    wire cout;
    wire [SIZE-1:0] sum;
    reg [SIZE-1:0] x,y;
    
    behavioral_adder uut( .x(x), .y(y), .sum(sum), .cout(cout));
    
    initial begin
        x = 255; y=255; #10;
        x = 211; y=120; #10;
        x = 6; y=7; #10;
        x = 100; y=12; #10;
        x = 30; y=9; #10;
        x = 121; y=15; #10;
        x = 11; y=12; #10;
        $finish();
     end     
endmodule

module Add_Sub_tb();
    wire cout;
    wire overflow;
    wire [3:0] sum;
    reg [3:0] A,B;
    reg cin;
    
    
    Add_Sub uut( .cin(cin), .A(A), .B(B), .sum(sum), .cout(cout), .overflow(overflow));
    
    initial begin
        cin=0;
        A = -8; B=-8; #10;
        A = 2; B=1; #10;
        A = 6; B=-7; #10;
        A = 7; B= 7; #10;
        cin=1;
        A = -8; B=-8; #10;
        A = 2; B=1; #10;
        A = 6; B=-7; #10;
        A = 7; B= 7; #10;
        A = 1; B= 2; #10;
     
        $finish();
     
     end     
endmodule