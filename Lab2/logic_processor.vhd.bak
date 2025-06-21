library ieee;
use ieee.std_logic_1164.all;

entity logic_processor is
port (
	logic_in0 : in std_logic_vector(3 downto 0);
	logic_in1 : in std_logic_vector(3 downto 0);
	mux_select									  : in std_logic_vector(1 downto 0);
	hex_out										  : out std_logic_vector(3 downto 0)
);

end logic_processor;

architecture mux_logic of logic_processor is
begin

with mux_select(1 downto 0) select
hex_out <= (logic_in0 AND logic_in1) when "00",
			  (logic_in0 OR logic_in1) when "01",
			  (logic_in0 XOR logic_in1) when "10",
			  (logic_in0 XNOR logic_in1) when "11";
			  
end mux_logic;