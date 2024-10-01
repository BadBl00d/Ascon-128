// testbench de la transformation Pc 

import ascon_pack::*; 

// description module
module Pc_tb(); 

type_state Pc_in_s, Pc_out_s; 
logic [3:0] Round_s;

//instance Pc_DUT 
Pc DUT (
	.Pc_in_i(Pc_in_s),
	.round_i(Round_s),
	.Pc_out_o(Pc_out_s));

// Process des stimulis à tester 
// il faut fixer l'entrée et regarder que la sortie est correcte

initial begin 
		 Round_s = 4'b0; // Round_s vaut 0
		 Pc_in_s[0] = 64'h80400c0600000000; // condition entrée Pc
		 Pc_in_s[1] = 64'h8a55114d1cb6a9a2;
		 Pc_in_s[2] = 64'hbe263d4d7aecaaff; 
		 Pc_in_s[3] = 64'h4ed0ec0b98c529b7; 
		 Pc_in_s[4] = 64'hc8cddf37bcd0284a;

	end 

endmodule : Pc_tb

