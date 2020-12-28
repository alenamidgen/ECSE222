library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alena_midgen_wrapper is 
	Port ( A, B					: in std_logic_vector(3 downto 0);
			 decoded_A			: out std_logic_vector(6 downto 0);
			 decoded_B			: out std_logic_vector(6 downto 0);
			 decoded_AplusB	: out std_logic_vector(13 downto 0));
end alena_midgen_wrapper;

architecture adding of alena_midgen_wrapper is
	component seven_segment_decoder
	Port ( code 			: in std_logic_vector(3 downto 0);
			segments_out	: out std_logic_vector(6 downto 0));
	end component;
	
	
	component alena_midgen_bcd_adder
	Port (A			: in std_logic_vector(3 downto 0);
			B			: in std_logic_vector(3 downto 0);
			S			: out std_logic_vector(3 downto 0);
			C_out		: out std_logic);
	end component;
	signal c, sum0, sum1, sum2, sum3: std_logic;
begin

	ssd1: seven_segment_decoder port map ( code => A, segments_out => decoded_A);
	ssd2: seven_segment_decoder port map ( code => B, segments_out => decoded_B);
	bcda: alena_midgen_bcd_adder port map ( A => A, B => B, S(0) => sum0, S(1) => sum1, S(2) => sum2, S(3) => sum3, C_out => c);
	ssd3: seven_segment_decoder port map ( code(3) => '0',
														code(2) => '0',
														code(1) => '0',
														code (0) => c,
														segments_out(6) => decoded_AplusB(13),
														segments_out(5) => decoded_AplusB(12),
														segments_out(4) => decoded_AplusB(11),
														segments_out(3) => decoded_AplusB(10),
														segments_out(2) => decoded_AplusB(9),
														segments_out(1) => decoded_AplusB(8),
														segments_out(0) => decoded_AplusB(7));  
	
	ssd4: seven_segment_decoder port map ( code(3) => sum3,
														code(2) => sum2,
														code(1) => sum1,
														code (0) => sum0,
														segments_out(6) => decoded_AplusB(6),
														segments_out(5) => decoded_AplusB(5),
														segments_out(4) => decoded_AplusB(4),
														segments_out(3) => decoded_AplusB(3),
														segments_out(2) => decoded_AplusB(2),
														segments_out(1) => decoded_AplusB(1),
														segments_out(0) => decoded_AplusB(0));
														
end adding;
