library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alena_midgen_bcd_adder is
	Port (A			: in std_logic_vector(3 downto 0);
			B			: in std_logic_vector(3 downto 0);
			S			: out std_logic_vector(3 downto 0);
			C_out		: out std_logic);
			
end alena_midgen_bcd_adder;

architecture behavioural of alena_midgen_bcd_adder is
signal sum : integer;

BEGIN 
	sum <= to_integer(unsigned(A)) + to_integer(unsigned(B));
	C_out <= '0' when (sum<10) else '1';
	S <= std_logic_vector(to_unsigned(sum, S'length)) when (sum<10) else std_logic_vector(to_unsigned(sum+6, S'length));
END behavioural;	