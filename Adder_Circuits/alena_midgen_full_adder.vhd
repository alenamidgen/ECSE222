library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alena_midgen_full_adder is
	Port (	a		: in std_logic;
				b		: in std_logic;
				c_in	: in std_logic;
				s		: out std_logic;
				c_out	: out std_logic);
end alena_midgen_full_adder;

architecture structure of alena_midgen_full_adder is
	component alena_midgen_half_adder
	Port (	a : in std_logic;
				b	: in std_logic;
				s : out std_logic;
				c : out std_logic);
	end component;
	signal s_HA1, c_HA1, c_HA2	: std_logic;
begin 
	HA1: alena_midgen_half_adder port map (a => a, b => b, s => s_HA1, c => c_HA1);
	HA2: alena_midgen_half_adder port map (a => c_in, b => s_HA1, s => s, c => c_HA2);
	c_out <= (c_HA1 OR c_HA2);
end structure;
