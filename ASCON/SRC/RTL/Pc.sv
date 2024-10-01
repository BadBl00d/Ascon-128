// declaration de la transformation Pc 
import ascon_pack::*;

//description
module Pc(
	input type_state Pc_in_i,
	input logic [3:0] round_i,
	output type_state Pc_out_o
);

// declaration materielle 

	 logic [63:0] Cr_s;

	// gestion des registres 0, 1, 3 et 4 ( tous sauf le 2 qui sera "XOR")
	assign Pc_out_o[0] = Pc_in_i[0]; //implicite 
	assign Pc_out_o[1] = Pc_in_i[1]; // concurrent avec déclaration implicite
	assign Pc_out_o[3] = Pc_in_i[3]; // idem
	assign Pc_out_o[4] = Pc_in_i[4];

	// gestion du registre 2 avec écriture de type Dataflow
	assign Cr_s = {'0, round_constant[round_i]};
	assign Pc_out_o[2] = Pc_in_i[2] ^ Cr_s;

//Rq, on aurait également pu concatener directement
// seuls les bits de poids faible de round_constant dans ascon_pack sont changés
	//assign Pc_out_[2][63:8] = Pc_in_i[2][63:8]; // bits inchangés
	//assign Pc_out_[2][7:0] = Pc_in_i[2][7:0] xor round_constant[round_i];


endmodule : Pc


