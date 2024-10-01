import ascon_pack ::*;

module Pl_tb ();

    // Define the inputs and outputs for the Pl module
    type_state Pl_in_i, Pl_out_o;

    // Instantiate the Pl module
    Pl uut (
        .Pl_in_i(Pl_in_i),
        .Pl_out_o(Pl_out_o)
    );

    // Initialize the inputs
    initial begin
        // Define the input type_state variables
        type_state Ps_i_s, Ps_o_s;

        // Assign values to the input type_state
        Ps_i_s[0] = 64'h80400c0600000000;
        Ps_i_s[1] = 64'h8a55114d1cb6a9a2;
        Ps_i_s[2] = 64'hbe263d4d7aecaaff;
        Ps_i_s[3] = 64'h4ed0ec0b98c529b7;
        Ps_i_s[4] = 64'hc8cddf37bcd0284a;

        // Assign Ps_i_s to Pl_in_i
        Pl_in_i = Ps_i_s;

        // Wait for some time
        #10;

        // Display the input values
        $display("Input Pl_in_i:");
        for (int i = 0; i < 5; i++) begin
            $display("[%0d] %h", i, Pl_in_i[i]);
        end

        // Wait for some more time
        #100;

        // Stop the simulation
        $stop;
    end

    // Display the output values
    always @* begin
        $display("Output Pl_out_o:");
        for (int i = 0; i < 5; i++) begin
            $display("[%0d] %h", i, Pl_out_o[i]);
        end
    end

endmodule

