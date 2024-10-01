//Permutation Ascon
//import bibliothèques
import ascon_pack::*; 
`include "mux_state.sv"
`include "Pc.sv"
`include "Ps.sv"
`include "Pl.sv"
`include "state_register_w_en.sv"


// Composant permutation 

module PermutationXOR
	import ascon_pack::*;
	(
	input type_state perm_in_i,
	input logic [3:0] round_perm_i,
	input logic select_i,
	input logic en_i,
	input logic resetb_i,
	input logic clock_i,
	input logic en_xor_data_begin_i,
	input logic en_xor_key_begin_i,
	input logic en_xor_lsb_end_i,
	input logic en_xor_key_end_i,
	input logic [127:0] key_i,
	input logic [63:0] data_i,
	input logic enable_cipher_i,
	input logic enable_tag_i,
	output [63:0] cipher_o,
	output [127:0] tag_o
	);

// Signaux internes
type_state output_mux_s, output_Pc_s, output_Ps_s, output_Pl_s, output_state_register_s,output_xor_begin_s,output_xor_end_s; 

mux_state mux_state_inst ( //Instance MUX
	.sel_i(select_i),
	.data1_i(perm_in_i),
	.data2_i(output_state_register_s),
	.data_o(output_mux_s)
);

xor_begin_perm xor_begin_perm_inst( //Instance XOR begin
	.en_xor_data_i(en_xor_data_begin_i), //active xor donnée associée ou plaintext
    	.en_xor_key_i(en_xor_key_begin_i), //active xor avec cle pour la finalisation
    	.key_i(key_i),
    	.data_i(data_i),
	.state_i(output_mux_s),
    	.state_o(output_xor_begin_s)
);

register_w_en register_w_en_inst1( // Instance cipher 
	.clock_i(clock_i),
    	.resetb_i(resetb_i),
    	.en_i(enable_cipher_i),
    	.data_i(output_xor_begin_s[0]),
    	.data_o(cipher_o)      
    ) ;
	
Pc Pc_inst (		//Instance Pc
	.Pc_in_i(output_xor_begin_s),
	.round_i(round_perm_i),
	.Pc_out_o(output_Pc_s)
);

Ps Ps_inst(		//Instance Ps
	.Ps_in_i(output_Pc_s),
	.Ps_out_o(output_Ps_s)
);

Pl Pl_inst(		//Instance Pl
	.Pl_in_i(output_Ps_s),
	.Pl_out_o(output_Pl_s)
);

xor_end_perm xor_end_perm_inst(
	.en_xor_lsb_i(en_xor_lsb_end_i), //active xor avec LSB en fin de DA
    	.en_xor_key_i(en_xor_key_end_i), //active xor avec cle en fin initialisation
    	.key_i(key_i),
    	.state_i(output_Pl_s),
    	.state_o(output_xor_end_s)
);

register_w_en register_w_en_inst2( // Instance tag 
	.clock_i(clock_i),
    	.resetb_i(resetb_i),
    	.en_i(enable_tag_o),
    	.data_i({output_xor_end_s[3],output_xor_end_s[4]}),
    	.data_o(cipher_o)      
    );
	

state_register_w_en state_register_w_en_inst (		//Instance Registre
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(en_i),
	.data_i(output_Pl_s),
	.data_o(output_state_register_s)
);

endmodule : PermutationXOR













