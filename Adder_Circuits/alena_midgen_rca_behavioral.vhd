library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alena_midgen_rca_behavioral is
	Port (A	 : in std_logic_vector (3 downto 0);
			B	 : in std_logic_vector (3 downto 0);
			S	 : out std_logic_vector (4 downto 0));
end alena_midgen_rca_behavioral;

architecture behavior of alena_midgen_rca_behavioral is
signal A_int, B_int, S_int : integer;
begin
	A_int <= to_integer(unsigned(A));
	B_int <= to_integer(unsigned(B));
	S_int <= (A_int + B_int);
	S <= std_logic_vector(to_unsigned(S_int, 5));
end behavior;