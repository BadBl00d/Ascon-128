//import bibliothèque
import ascon_pack ::*;

// Import de Sbox.sv
`include "Sbox.sv"


// Déclaration du module
module Ps(
    input type_state Ps_in_i,
    output type_state Ps_out_o
);

	genvar i; 
	generate 
		for (i = 0; i<64; i=i+1)
			begin : generate_sbox
				Sbox sbox_u
					(
						.x({Ps_in_i[0][i],Ps_in_i[1][i],Ps_in_i[2][i],Ps_in_i[3][i],Ps_in_i[4][i] }),
						.Sx({Ps_out_o[0][i],Ps_out_o[1][i],Ps_out_o[2][i],Ps_out_o[3][i],Ps_out_o[4][i] })
						);
		end
	endgenerate

endmodule : Ps

