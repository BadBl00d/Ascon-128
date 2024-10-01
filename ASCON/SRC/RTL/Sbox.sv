// déclaration de la Sbox

//import bibliothèque
import ascon_pack ::*;
	
// Déclaration module	
module Sbox(
    input [4:0] x,
    output reg [4:0] Sx
);

// Switch case
always @(*)
    case(x)
        5'h0: Sx = 5'h4;
        5'h1: Sx = 5'hB;
        5'h2: Sx = 5'h1F;
        5'h3: Sx = 5'h14;
        5'h4: Sx = 5'h1A;
        5'h5: Sx = 5'h15;
        5'h6: Sx = 5'h9;
        5'h7: Sx = 5'h2;
        5'h8: Sx = 5'h1B;
        5'h9: Sx = 5'h5;
        5'hA: Sx = 5'h8;
        5'hB: Sx = 5'h12;
        5'hC: Sx = 5'h1D;
        5'hD: Sx = 5'h3;
        5'hE: Sx = 5'h6;
        5'hF: Sx = 5'h1C;
        5'h10: Sx = 5'h1E;
        5'h11: Sx = 5'h0;
        5'h12: Sx = 5'hD;
        5'h13: Sx = 5'h11;
        5'h14: Sx = 5'h7;
        5'h15: Sx = 5'hE;
        5'h16: Sx = 5'h10;
        5'h17: Sx = 5'h18;
        5'h18: Sx = 5'hF;
        5'h19: Sx = 5'h1A;
        5'h1A: Sx = 5'h1B;
        5'h1B: Sx = 5'h16;
        5'h1C: Sx = 5'hC;
        5'h1D: Sx = 5'h2B;
        5'h1E: Sx = 5'h3;
        5'h1F: Sx = 5'h1E;
        // default: Sx = 5'h0; // Au cazou
    endcase

endmodule

