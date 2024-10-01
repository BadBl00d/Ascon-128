import ascon_pack ::*;




// Déclaration du module
module Pl(
    input type_state Pl_in_i,
    output type_state Pl_out_o
);

    assign Pl_out_o[0] = Pl_in_i[0] ^ {Pl_in_i[0][18:0], Pl_in_i[0][63:19]} ^ {Pl_in_i[0][27:0], Pl_in_i[0][63:28]};
    assign Pl_out_o[1] = Pl_in_i[1] ^ {Pl_in_i[0][60:0], Pl_in_i[0][63:61]} ^ {Pl_in_i[0][38:0], Pl_in_i[0][63:39]};
    assign Pl_out_o[2] = Pl_in_i[2] ^ {Pl_in_i[0][0], Pl_in_i[0][63:1]} ^ {Pl_in_i[0][5:0], Pl_in_i[0][63:6]};
    assign Pl_out_o[3] = Pl_in_i[3] ^ {Pl_in_i[0][9:0], Pl_in_i[0][63:10]} ^ {Pl_in_i[0][16:0], Pl_in_i[0][63:17]};
    assign Pl_out_o[4] = Pl_in_i[4] ^ {Pl_in_i[0][6:0], Pl_in_i[0][63:7]} ^ {Pl_in_i[0][40:0], Pl_in_i[0][63:41]};

endmodule : Pl

