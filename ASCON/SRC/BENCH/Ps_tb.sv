import ascon_pack ::*;

module Ps_tb ();

	type_state Ps_i_s, Ps_o_s; 
	
	Ps DUT 
		(
		.Ps_in_i(Ps_i_s),
		.Ps_out_o(Ps_o_s)
		);
	initial begin 
		
		integer i;
		Ps_i_s[0] =  64'h80400c0600000000; 
		Ps_i_s[1] =  64'h8a55114d1cb6a9a2; 
		Ps_i_s[2] =  64'hbe263d4d7aecaaff;
		Ps_i_s[3] =  64'h4ed0ec0b98c529b7; 
		Ps_i_s[4] =  64'hc8cddf37bcd0284a;

		for (i = 0; i<5; i++)
			// affichage écran
			$display("substitution input[%1d] %h", i, Ps_i_s[i]); 
		#10 // wait 10
		for (i = 0; i<5; i++)
			$display("substitution output[%1d] %h", i, Ps_o_s[i]); 
  
		$stop();
	end
endmodule // Ps_tb
