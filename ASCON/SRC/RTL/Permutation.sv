//Permutation Ascon
//import bibliothèques
import ascon_pack::*; 
`include "mux_state.sv"
`include "Pc.sv"
`include "Ps.sv"
`include "Pl.sv"
`include "state_register_w_en.sv"

//Déclaration du module
module Permutation(
	input logic clock_i, 
	input logic resetb_i, 
	input logic enable_i, 
	input logic select_i, 
	input logic [3:0] round_i, 
	input type_state data_i,
	output type_state data_o // Add data_o port declaration
	);

//input signals declaration 
type_state output_mux_s; 
type_state output_Pc_s; 
type_state output_Ps_s; 
type_state output_Pl_s; 
type_state output_state_register_s; 

//mux_state instance declaration 
mux_state mux_instance (
	.sel_i(select_i), 
	.data1_i(data_i), 
	.data2_i(output_state_register_s), 
	.data_o(output_mux_s) );

//Pc instance declaration 
Pc Pc_instance (
	.Pc_in_i(output_mux_s),
	.round_i(round_i),
	.Pc_out_o(output_Pc_s) );
	
//Pl instance declaration 
Ps Ps_instance (
	.Ps_in_i(output_Pc_s),
	.Ps_out_o(output_Ps_s) );

//state_register instance declaration 
state_register_w_en state_register_w_en_instance  (
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(enable_i),	
	.data_i(output_Ps_s),
	.data_o(output_state_register_s) );

// Assign data_o
    assign data_o = output_state_register_s;

endmodule : Permutation 















