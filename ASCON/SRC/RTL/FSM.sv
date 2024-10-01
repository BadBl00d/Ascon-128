//Module FSM pour ASCON

//import bibliothèques
import ascon_pack::*; 


//Déclaration du module
module FSM(
	//input 
	input logic clock_i, 
	input logic resetb_i, 

	input logic [1:0] block_i, 
	input logic [3:0] round_i,

	input logic data_valid_i,
	input logic start_i,
	
	//output
	//1°) round counter
	output logic init_a_o,
	output logic init_b_o,
	output logic enable_round_o, 

	//2°) block counter
	output logic init_block_o, 
	output logic enable_block_o,

	//input data 
	output logic enable_data_o,

	//3°) enable xor  
	output logic en_xor_key_b_o,
	output logic en_xor_data_b_o,
	output logic en_xor_key_e_o,
	output logic en_xor_lsb_e_o,
	
	//4°)enable register
	output logic en_reg_state_o,
	output logic en_cipher_o,
	output logic en_key_o,
	
	//5°)outputs
	output logic end_o,
	output logic cipher_valid_o 
	);

// liste d'etats
typedef enum {idle, conf_init, start_init, init, end_init, idle_da} State; 
State Ep, Ef; 

// sequential process
always @(posedge clock_i, negedge resetb_i) begin 
	if (resetb_i ==1'b0) begin 
		Ep >= idle; 
	end 
	else begin 
		Ep <= Ef;
	end 
end 

//Premeir process combinatoire
always (*) begin 
	case (Ep)

	idle:
		if (start_i ==1'b1) begin 
			Ef = conf_init; 
		end 
		else begin 
			Ef = idle;
		end 
	
	conf_init:
		Ef = start_init;

	start_init:
		Ef = init;
		
	init:
		if (round_i == 4'hA) begin 
			Ef = end_init;
		else
			Ef = init;
		end

	end_init:
		Ef = idle_da;
	idle_da:
		Ef = idle_da;
	endcase 
end

//Second process combinatoire
valways (*) begin 
	case (Ep)
	idle: begin 
		init_a_o = 1'b0;
		init_b_o = 1'b0;
		enable_round_o = 1'b0;
		enable_block_o = = 1'b0;
		init_block_o = 1'b0;
		enable_data_o= 1'b0;
		enable_block_o = 1'b0;
		en_xor_key_b_o= 1'b0;
		en_xor_data_b_o= 1'b0;
		en_xor_key_e_o= 1'b0;
		en_xor_lsb_e_o= 1'b0;
		en_reg_state_o= 1'b0;
		en_cipher_o= 1'b0;
		en_tag_o = 1'b0;
		en_key_o= 1'b0;
		end_o= 1'b0;
		cipher_valid_o= 1'b0;
	end

	conf_init: begin 
		init_a_o = 1'b1;
		init_b_o = 1'b0;
		enable_round_o = 1'b1;
		enable_block_o = = 1'b0;
		init_block_o = 1'b0;
		enable_data_o= 1'b0;
		enable_block_o = 1'b0;
		en_xor_key_b_o= 1'b0;
		en_xor_data_b_o= 1'b0;
		en_xor_key_e_o= 1'b0;
		en_xor_lsb_e_o= 1'b0;
		en_reg_state_o= 1'b0;
		en_cipher_o= 1'b0;
		en_tag_o = 1'b0;
		en_key_o= 1'b0;
		end_o= 1'b0;
		cipher_valid_o= 1'b0;
	end 

	start_init: begin
		init_a_o = 1'b0;
		init_b_o = 1'b0;
		enable_round_o = 1'b1;
		enable_block_o = = 1'b0;
		init_block_o = 1'b0;
		enable_data_o= 1'b0;
		enable_block_o = 1'b0;
		en_xor_key_b_o= 1'b0;
		en_xor_data_b_o= 1'b0;
		en_xor_key_e_o= 1'b0;
		en_xor_lsb_e_o= 1'b0;
		en_reg_state_o= 1'b1; // on commence à sauvegarder l'état interne
		en_cipher_o= 1'b0;
		en_tag_o = 1'b0;
		en_key_o= 1'b0;
		end_o= 1'b0;
		cipher_valid_o= 1'b0;
	end

	init: begin 

		init_a_o = 1'b0;
		init_b_o = 1'b0;
		enable_round_o = 1'b1;
		enable_block_o = = 1'b0;
		init_block_o = 1'b0;
		enable_data_o= 1'b1;
		enable_block_o = 1'b0;
		en_xor_key_b_o= 1'b0;
		en_xor_data_b_o= 1'b0;
		en_xor_key_e_o= 1'b0;
		en_xor_lsb_e_o= 1'b0;
		en_reg_state_o= 1'b1;
		en_cipher_o= 1'b0;
		en_tag_o = 1'b0;
		en_key_o= 1'b0;
		end_o= 1'b0;
		cipher_valid_o= 1'b0;

	end_init: begin 

		init_a_o = 1'b0;
		init_b_o = 1'b0;
		enable_round_o = 1'b1;
		enable_block_o = = 1'b0;
		init_block_o = 1'b0;
		enable_data_o= 1'b1;
		enable_block_o = 1'b0;
		en_xor_key_b_o= 1'b0;
		en_xor_data_b_o= 1'b0;
		en_xor_key_e_o= 1'b1; // on le commende après la phase d'initialisation 
		en_xor_lsb_e_o= 1'b0;
		en_reg_state_o= 1'b0;
		en_cipher_o= 1'b0;
		en_tag_o = 1'b0;
		en_key_o= 1'b0;
		end_o= 1'b0;
		cipher_valid_o= 1'b0;

	idle_da: begin 

		init_a_o = 1'b0;
		init_b_o = 1'b0;
		enable_round_o = 1'b0;
		enable_block_o = = 1'b0;
		init_block_o = 1'b0;
		enable_data_o= 1'b1;
		enable_block_o = 1'b0;
		en_xor_key_b_o= 1'b0;
		en_xor_data_b_o= 1'b0;
		en_xor_key_e_o= 1'b0;
		en_xor_lsb_e_o= 1'b0;
		en_reg_state_o= 1'b1;
		en_cipher_o= 1'b0;
		en_tag_o = 1'b0;
		en_key_o= 1'b0;
		end_o= 1'b0;
		cipher_valid_o= 1'b0;

	endcase 
end




endmodule: FSM
