library ieee;
use ieee.std_logic_1164.all;

entity PB_filters is port (
	clkin				: in std_logic;
	rst_n				: in std_logic;
	rst_n_filtered	: out std_logic;
 	pb_n				: in  std_logic_vector (3 downto 0);
	pb_n_filtered	: out	std_logic_vector(3 downto 0)							 
	); 
end PB_filters;

architecture ckt of PB_filters is

	Signal sreg0, sreg1, sreg2, sreg3, sreg4	: std_logic_vector(3 downto 0);

BEGIN

process (clkin) is

begin
	if (rising_edge(clkin)) then
	
		
		sreg4(3 downto 0) <= sreg4(2 downto 0) & rst_n;
				
		sreg3(3 downto 0) <= sreg3(2 downto 0) & pb_n(3);
		sreg2(3 downto 0) <= sreg2(2 downto 0) & pb_n(2);
		sreg1(3 downto 0) <= sreg1(2 downto 0) & pb_n(1);
		sreg0(3 downto 0) <= sreg0(2 downto 0) & pb_n(0);
				
		
	end if;
	
		rst_n_filtered   <= sreg4(3) OR sreg4(2) OR sreg4(1);
		
		pb_n_filtered(3) <= sreg3(3) OR sreg3(2) OR sreg3(1);
		pb_n_filtered(2) <= sreg2(3) OR sreg2(2) OR sreg2(1);
		pb_n_filtered(1) <= sreg1(3) OR sreg1(2) OR sreg1(1);
		pb_n_filtered(0) <= sreg0(3) OR sreg0(2) OR sreg0(1);
		
end process;
end ckt;