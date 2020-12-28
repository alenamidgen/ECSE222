library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_segment_decoder is
	port ( code 			: in std_logic_vector(3 downto 0);
			 segments_out	: out std_logic_vector(6 downto 0));
	end seven_segment_decoder;

architecture decoder of seven_segment_decoder is
begin
WITH code SELECT 
segments_out <=
	"1000000" WHEN "0000",
	"1111001" WHEN "0001",
	"0100100" WHEN "0010", 
	"0110000" WHEN "0011", 
	"0011001" WHEN "0100",
	"0010010" WHEN "0101", 
	"0000010" WHEN "0110",
	"1111000" WHEN "0111",
	"0000000" WHEN "1000",
	"0010000" WHEN "1001",
	"1111111" WHEN others;
end decoder;