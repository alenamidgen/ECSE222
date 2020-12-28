library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alena_midgen_bcd_adder is
	Port (A			: in std_logic_vector(3 downto 0);
			B			: in std_logic_vector(3 downto 0);
			S			: out std_logic_vector(3 downto 0);
			Y			: buffer std_logic_vector(3 downto 0);
			Z			: buffer std_logic_vector(3 downto 0);
			C_out		: out std_logic);
			
end alena_midgen_bcd_adder;

architecture structure of alena_midgen_bcd_adder is

	component alena_midgen_rca_structural
	Port (A		 : in std_logic_vector (3 downto 0);
			B		 : in std_logic_vector (3 downto 0);
			S	 : out std_logic_vector (3 downto 0);
			c_out  : out std_logic);
	end component;
	
	--variable temp_sum : std_logic_vector(3 downto 0);
	signal c, c_2 : std_logic;
	
begin
	RCA1: alena_midgen_rca_structural port map (A, B, Z, c); 
	
	Y(0) <= '0';
	Y(1) <= (c OR (Z(1) AND Z(3)) OR (Z(2) AND Z(3)));
	Y(2) <= (c OR (Z(1) AND Z(3)) OR (Z(2) AND Z(3)));
	Y(3) <= '0';
	
	RCA2: alena_midgen_rca_structural port map (Z, Y, S, c_2);
	C_out <= Y(1);
	
end structure;
