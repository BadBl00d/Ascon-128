//ASCON128 Module 
import ascon_pack*::;

// ASCON FSM
module ASCON (
	//input
	input logic [63:0] data_i,
	input logic data_valid, 
	input logic [127:0] key_i, 
	input logic start_i, 
	input logic [127:0] nonce_i

	//output
	output logic [63:0] cipher_o,
	output logic cipher_valid_o,
	output logic [127:0] key_o,
	output logic end_o
);


//Siganux internes 
logic enable_round_s; 
logic init_round_p12_s; 
logic init_round_p6_s; 
logic [3:0] round_s;

logic 


// Machine de Moore
fsm_moore U0(
	.clock_i(),
	.resetb_i(),
	.block_i(),
	.round_i(round_s),
	.data_valid_i(),
	.start_i(),
	.init_a_o(),
	.init_b_o(),
	.enable_round_o(),
	.init_block_o(),
	.enable_block_o(),
	.enable_data_o(),
	.en_xor_key_b_o(),
	.en_xor_data_b_o(),
	.en_xor_key_e_o(),
	.en_xor_lsb_e_o(),
	.en_reg_state_o(),
	.en_cipher_o(),
	.en_key_o(),
	.end_o(),
	.cipher_valid_o()
);

// Instances compteurs de bloc 
//Compteur simple
compteur_simple_init U1 (
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(enable_block_s), //
	.init_a_i(init_block_s), //
	.data_o(block_s) //
);


//Compteur double
compteur_double_init U2 (
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(enable_round_s),
	.init_a_i(init_round_p12_s),
	.init_b_i(init_round_p6_s),
	.data_o(round_s),
);

permutation_input_s[0] = 64'h80400c0600000000; //IV
permutation_input_s[1] = key_i [127:64] //MSB key
permutation_input_s[2] = key_i [63:0] // LBS key
permutation_input_s[3] = nonce_i [127:64] //MSB nonce
permutation_input_s[0] = nonce_i [63:0] //LSB nonce



//PermutationXOR 
permutation U3(
.clock_i(clock_i),
.resetb_i(resetb_i),
.enable_i(enable_state_register_s), //
.select_i(select_data_i),
.round_i(round_s),
.data_i(permutation_input_s),
// need to add all the other inputs
);







