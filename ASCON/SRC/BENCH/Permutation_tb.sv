`timescale 1 ns/ 1 ps

import ascon_pack::*;

module permutation_inter_tb 
   (
    ) ;

   type_state state_i_s;
   type_state state_o_s;

   logic       resetb_s;
   logic       clock_s =1'b0;
   logic       data_sel_s;
   logic       en_reg_state_s;
   //logic       en_xor_key_s;
   //logic       en_xor_key_end_s;
   //logic       en_xor_lsb_s;
   //logic       en_xor_data_s;

   //logic [127:0] key_s;
   logic [63:0]  data_s;
   logic [3:0] round_s;
   //logic [63:0] cipher_s;  
   //logic [127:0] tag_s;
   
   
  
   
   
   permutation_inter DUT (
					.clock_i(clock_s),
					.resetb_i(resetb_s),
					.data_sel_i(data_sel_s),
					.en_reg_state_i(en_reg_state_s),
					//.en_xor_key_i(en_xor_key_s),
					//.en_xor_lsb_i(en_xor_lsb_s),
					//.en_xor_data_i(en_xor_data_s),
					//.en_xor_key_end_i(en_xor_key_end_s),
					//.key_i(key_s),
					.data_i(data_s),
					.round_i(round_s),
					.state_i(state_i_s),
					.state_o(state_o_s)
					);
   
   always  begin
       assign  clock_s = ~clock_s;
      #10;
      
   end
   
   initial begin
      int i;
      data_s ='0;
      //key_s	 = 128'h000102030405060708090A0B0C0D0E0F;
      
      state_i_s[0] = 64'h80400C0600000000; 
      state_i_s[1] = 64'h0001020304050607; 
      state_i_s[2] = 64'h08090a0b0c0d0e0f; 
      state_i_s[3] = 64'h0011223344556677; 
      state_i_s[4] = 64'h8899aabbccddeeff;
      	
      resetb_s   = 1'b0;
      data_sel_s = 1'b0;
      //en_xor_data_s      = 1'b0;
      //en_xor_key_s  = 1'b0;
      //en_xor_lsb_s       = 1'b0;
      //en_xor_key_end_s = 1'b0;
      en_reg_state_s     = 1'b1;
      round_s    = 4'b0000;
      #105;
      resetb_s   = 1'b1;
      #20;
      data_sel_s = 1'b1;
      round_s = 4'b0001;
      #20;
      round_s = 4'b0010;
      
      #20;
      round_s = 4'b0011;
      
      #20;
      round_s = 4'b0100;
      
      #20;
      round_s = 4'b0101;
      
      #20;
      round_s = 4'b0110;
      
      #20;
      round_s = 4'b0111;
      
      #20;
      round_s = 4'b1000;
      
      #20;
      round_s = 4'b1001;
      
      #20;
      round_s = 4'b1010;
      
      #20;
      round_s = 4'b1011;
      //en_xor_key_s = 1'b1;
      #20;
      
   end
endmodule: permutation_inter_tb
