`timescale 1ns / 1ps

module Sbox_tb();

    // déclaration des signaux
    	logic [4:0] x, Sx;
 

    // instanciation 
    Sbox DUT (
        .x(x),
        .Sx(Sx)
    );

    // stimulis
    initial begin
        // Test de toutes les entrées possibles
        for (int i = 0; i < 32; i = i + 1) 
		begin
		    x = i;
		end
    end

endmodule

