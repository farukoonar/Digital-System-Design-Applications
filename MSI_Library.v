`timescale 1ns / 1ps

module MSI_Library();
endmodule


module DECODER(
    input [3:0] IN,   
    output reg [15:0] OUT
    );
    
    always @(IN) begin
        case(IN)
        
            4'b0000 : OUT = 16'b0000_0000_0000_0001;
            4'b0001 : OUT = 16'b0000_0000_0000_0010;
            4'b0010 : OUT = 16'b0000_0000_0000_0100;
            4'b0011 : OUT = 16'b0000_0000_0000_1000;
            
            4'b0100 : OUT = 16'b0000_0000_0001_0000;
            4'b0101 : OUT = 16'b0000_0000_0010_0000;
            4'b0110 : OUT = 16'b0000_0000_0100_0000;
            4'b0111 : OUT = 16'b0000_0000_1000_0000;
            
            4'b1000 : OUT = 16'b0000_0001_0000_0000;
            4'b1001 : OUT = 16'b0000_0010_0000_0000;
            4'b1010 : OUT = 16'b0000_0100_0000_0000;
            4'b1011 : OUT = 16'b0000_1000_0000_0000;
            
            4'b1100 : OUT = 16'b0001_0000_0000_0000;
            4'b1101 : OUT = 16'b0010_0000_0000_0000;
            4'b1110 : OUT = 16'b0100_0000_0000_0000;
            4'b1111 : OUT = 16'b1000_0000_0000_0000;   
            
            default : OUT = 16'b0000_0000_0000_0000;
            
        endcase
    end        
endmodule

//primitive gates
module ENCODER1(
    input [3:0] IN,
    output [1:0] OUT,
    output V
    );
    
    assign OUT[0] = IN[3] | (IN[1] & ~IN[2]);
    assign OUT[1] = IN[3] | IN[2]; 
    assign V = IN[3] | IN[2] | IN[1] | IN[0];
    
endmodule
 
//always and case structure
module ENCODER2(
    input [3:0] IN,
    output reg [1:0] OUT,
    output reg V
    );
 
    always @(IN) begin
        casez(IN)
            4'b0000 : begin OUT = 2'b00; V = 1'b0; end
            4'b0001 : begin OUT = 2'b00; V = 1'b1; end
            4'b001? : begin OUT = 2'b01; V = 1'b1; end
            4'b01?? : begin OUT = 2'b10; V = 1'b1; end
            4'b1??? : begin OUT = 2'b11; V = 1'b1; end
            default : OUT = 2'b00;
        
        endcase
    end
endmodule
 
 
module MUX1(
    input [3:0] D,
    input [1:0] S,
    output O
    );
    
    assign O = ((~S[1] & ~S[0] & D[0]) | (~S[1] & S[0] & D[1]) | (~S[0] & S[1] & D[2]) | (S[1] & S[0] & D[3]));
    
endmodule 


module MUX2(
    input [3:0] D,
    input [1:0] S,
    output reg O
    );
    
    always@(S,D) begin
        case(S)
            2'b00  :  O=D[0];
            2'b01  :  O=D[1];
            2'b10  :  O=D[2];
            2'b11  :  O=D[3];
            default : O=1'bZ;
        endcase
    end
endmodule 
    
    
module DEMUX(
input D,
input [1:0] S,
output [3:0] O);

    wire s0, s1;
    wire [3:0] E;    

    not(s0, S[0]); 
    not(s1, S[1]); 

    and(E[0], s1, s0);     
    and(E[1], s1, S[0]);  
    and(E[2], S[1], s0);    
    and(E[3], S[1], S[0]);  

    bufif1(O[0], D, E[0]);
    bufif1(O[1], D, E[1]);
    bufif1(O[2], D, E[2]);
    bufif1(O[3], D, E[3]);
  
endmodule