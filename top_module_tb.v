`timescale 1ns / 1ps

module top_module_tb();
endmodule


module decoder_tb();

    reg [7:0] sw;
    reg [3:0] btn;
    
    wire [7:0] led;
    wire [6:0] cat;
    wire [3:0] an;
    wire dp;
    
    top_module uut(.sw(sw), .btn(btn), .led(led), .cat(cat), .an(an), .dp(dp));
    
    initial begin
    
        sw = 4'b0000; #10;
        sw = 4'b0001; #10; 
        sw = 4'b0010; #10; 
        sw = 4'b0011; #10; 
        
        sw = 4'b0100; #10; 
        sw = 4'b0101; #10; 
        sw = 4'b0110; #10; 
        sw = 4'b0111; #10; 
        
        sw = 4'b1000; #10; 
        sw = 4'b1001; #10; 
        sw = 4'b1010; #10; 
        sw = 4'b1011; #10; 
        
        sw = 4'b1100; #10; 
        sw = 4'b1101; #10; 
        sw = 4'b1110; #10; 
        sw = 4'b1111; #10; 
        
        $finish();
    end
endmodule


module encoder_tb();

    reg [7:0] sw;
    reg [3:0] btn;
    
    wire [7:0] led;
    wire [6:0] cat;
    wire [3:0] an;
    wire dp;
    
    top_module uut(.sw(sw), .btn(btn), .led(led), .cat(cat), .an(an), .dp(dp));
    
    initial begin
    
        sw = 4'b0000; #10;
        sw = 4'b0001; #10; 
        sw = 4'b0010; #10; 
        sw = 4'b0011; #10; 
        
        sw = 4'b0100; #10; 
        sw = 4'b0101; #10; 
        sw = 4'b0110; #10; 
        sw = 4'b0111; #10; 
        
        sw = 4'b1000; #10; 
        sw = 4'b1001; #10; 
        sw = 4'b1010; #10; 
        sw = 4'b1011; #10; 
        
        sw = 4'b1100; #10; 
        sw = 4'b1101; #10; 
        sw = 4'b1110; #10; 
        sw = 4'b1111; #10; 
        
        $finish();
    end
endmodule 


module mux_tb();

    reg [7:0] sw;
    reg [3:0] btn;
    
    wire [7:0] led;
    wire [6:0] cat;
    wire [3:0] an;
    wire dp;
    
    top_module uut(.sw(sw), .btn(btn), .led(led), .cat(cat), .an(an), .dp(dp));
    
    initial begin
    
        sw = 4'b0000; btn=2'b00; #10;
        sw = 4'b0001; #10; 
        sw = 4'b0010; #10; 
        sw = 4'b0100; #10; 
        sw = 4'b1000; #10; 
        
        sw = 4'b0000; btn=2'b01; #10;
        sw = 4'b0001; #10; 
        sw = 4'b0010; #10; 
        sw = 4'b0100; #10; 
        sw = 4'b1000; #10; 
        
        sw = 4'b0000; btn=2'b10; #10;
        sw = 4'b0001; #10; 
        sw = 4'b0010; #10; 
        sw = 4'b0100; #10; 
        sw = 4'b1000; #10; 
        
        sw = 4'b0000; btn=2'b11; #10;
        sw = 4'b0001; #10; 
        sw = 4'b0010; #10; 
        sw = 4'b0100; #10; 
        sw = 4'b1000; #10;  
        
        $finish();
        
    end
endmodule 


module demux_tb();

    reg [7:0] sw;
    reg [3:0] btn;
    
    wire [7:0] led;
    wire [6:0] cat;
    wire [3:0] an;
    wire dp;
    
    top_module uut(.sw(sw), .btn(btn), .led(led), .cat(cat), .an(an), .dp(dp));
    
    initial begin
    
        btn = 2'b00; sw=1'b0; #10;
        btn = 2'b01; #10; 
        btn = 2'b10; #10; 
        btn = 2'b11; #10; 
        
        btn = 2'b00; sw=1'b1; #10;
        btn = 2'b01; #10; 
        btn = 2'b10; #10; 
        btn = 2'b11; #10; 
        $finish();
    end
endmodule

