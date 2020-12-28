library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alena_midgen_rca_structural is
	Port (A	 : in std_logic_vector (3 downto 0);
			B	 : in std_logic_vector (3 downto 0);
			S	 : out std_logic_vector (4 downto 0));
end alena_midgen_rca_structural;

architecture structure of alena_midgen_rca_structural is
	component alena_midgen_half_adder
	Port (	a	: in std_logic;
				b	: in std_logic;
				s	: out std_logic;
				c	: out std_logic);
	end component;
	
	component alena_midgen_full_adder
	Port (	a		: in std_logic;
				b		: in std_logic;
				c_in	: in std_logic;
				s		: out std_logic;
				c_out	: out std_logic);
	end component;
	
	signal c_out_1, c_out_2, c_out_3	: std_logic;
begin
	HA1: alena_midgen_half_adder port map (a => A(0), b => B(0), s => S(0), c => c_out_1);
	FA1: alena_midgen_full_adder port map (a => A(1), b => B(1), c_in => c_out_1, s => S(1), c_out => c_out_2);
	FA2: alena_midgen_full_adder port map (a => A(2), b => B(2), c_in => c_out_2, s => S(2), c_out => c_out_3);
	FA3: alena_midgen_full_adder port map (a => A(3), b => B(3), c_in => c_out_3, s => S(3), c_out => S(4));
	
end structure;