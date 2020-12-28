-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "02/23/2020 15:23:03"
                                                            
-- Vhdl Test Bench template for design  :  alena_midgen_bcd_adder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;                                

ENTITY alena_midgen_bcd_adder_vhd_tst IS
END alena_midgen_bcd_adder_vhd_tst;
ARCHITECTURE alena_midgen_bcd_adder_arch OF alena_midgen_bcd_adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL C_out : STD_LOGIC;
SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Z : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT alena_midgen_bcd_adder
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	C_out : BUFFER STD_LOGIC;
	S : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	Z : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : alena_midgen_bcd_adder
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	C_out => C_out,
	S => S,
	Y => Y,
	Z => Z
	);
                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        FOR i in 0 to (2**A'length -1) loop
		A <= std_logic_vector(to_unsigned(i, A'length));
		FOR j in 0 to (2** B'length -1) loop
			B <= std_logic_vector(to_unsigned(j, B'length));
			wait for 10 ns;
		end loop;
	end loop;
WAIT;                                                        
END PROCESS always;                                          
END alena_midgen_bcd_adder_arch;
