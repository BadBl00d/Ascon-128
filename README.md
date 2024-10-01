# ASCON128 Algorithm Implementation in SystemVerilog

## Project Description
This project involves modeling the **ASCON128 encryption algorithm** using **SystemVerilog** hardware description language. The goal is to provide a reliable and optimized implementation for resource-constrained embedded environments while protecting against physical attacks.

This project focuses on designing the core transformations, permutations, and a finite state machine (FSM) that manages the encryption and authentication process. The project also includes validation tests for each component.

## Global Operation
ASCON128 is an encryption and authentication algorithm that works on a message through several blocks:

1. **Finite State Machine (FSM)**: Controls the operation flow and manages the different states of the encryption and authentication process.
2. **Permutation Block**: Ensures secure data mixing at each step of the process.
3. **XOR Blocks**: Apply XOR operations to combine data with the internal state, contributing to data obfuscation.
4. **Permutation Counters**: Track the number of permutations performed, regulating the flow of the encryption and authentication process.

![Overall ASCON Diagram](./pics/ascon_overview.png)

## Project Structure

The project is organized into a clear file structure:
- **/SRC/RTL**: Contains the Verilog module instances.
- **/SRC/BENCH**: Contains the testbenches.
- **/LIB/LIB_RTL**: Stores RTL simulation results.
- **/LIB/LIB_BENCH**: Stores testbench simulation results.

Example project tree structure:
TREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE !!!!!!!!!!!!!!!!!!!!!


## Design Details

### Core Transformations: 𝒑𝑪 and 𝒑𝑺
The transformations are essential components of the algorithm. They manipulate the internal state of the algorithm.
- **𝑝𝐶** handles constant addition.
- **𝑝𝑆** applies substitutions using a custom Sbox.

![Pc and Ps Architecture](./pics/architecture_pc_ps.png)

### Linear Diffusion Layer
Data diffusion is achieved by applying rotations and XORs across the internal state registers.

![Linear Diffusion Layer](./pics/linear_diffusion.png)

### Global Permutation

The permutation is a central element used to transform the internal state through several iterations. It can include optional XOR operations, depending on the encryption mode.

![Global Permutation](./pics/global_permutation.png)

### Finite State Machine (FSM)

The FSM controls the overall encryption and authentication process, transitioning between various states to complete the operations.

#### FSM States:
1. **Idle**: The initial state where all variables are zero, waiting for a start signal.
2. **Conf_Init**: Prepares initial permutations and sets the counter.
3. **Init**: Performs the permutations until the counter reaches the required number (12 for 𝑝12).
4. **DA (Data Absorption)**: Processes data after initialization.
5. **Cipher**: Executes encryption operations in a loop.
6. **Tag**: Calculates the authentication tag.

![FSM Diagram](./pics/fsm_diagram.png)

The FSM is essential for managing the encryption phases. It ensures synchronization between steps and handles state transitions.

### FSM Testing

Each FSM state was tested using **testbenches** to ensure correct operation. Below is an example of the result for the **Conf_Init** state after simulation:

![FSM Testbench Result](./pics/fsm_testbench_result.png)

The simulations confirm that the FSM transitions between states correctly and handles the encryption process as expected.

### Final Results

The final results of the implementation show that the ASCON128 algorithm has been correctly modeled and tested. Each step, from permutations to XOR calculations, works as expected. Below is an example of the results obtained from a complete permutation:

![Complete Permutation Result](./pics/complete_permutation.png)

### Issues Encountered and Solutions

During simulation, issues with **Modelsim** were encountered, specifically with the optimization parameters `opt2` and `opt3`. These parameters caused compilation errors when running testbenches. To resolve this, I used **Icarus Verilog**, an open-source simulator, which allowed successful testing.

### Conclusion

This project provides a complete implementation of the **ASCON128** algorithm in **SystemVerilog**, considering the efficiency and security constraints typical of embedded devices. The project was validated through extensive simulations, and the results show that the implementation meets the expected cryptographic security standards.

## Author

**Chloé Larroze**  
Project completed as part of PCSN course at ISMIN (Mines Saint-Étienne)  
Date: May 2, 2024
