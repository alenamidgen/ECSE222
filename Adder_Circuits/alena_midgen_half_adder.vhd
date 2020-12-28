library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alena_midgen_half_adder is
	Port (	a : in std_logic;
				b : in std_logic;
				s : out std_logic;
				c : out std_logic);
end alena_midgen_half_adder;

architecture structure of alena_midgen_half_adder is
begin
	s <= (a XOR b);
	c <= (a AND b);
end structure;