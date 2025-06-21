
-- Section 205 Group 6 : Jennifer Kuang, Nur Iscan

library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------------------
-- 		Inverts active-low reset and push-button signals 	 --
---------------------------------------------------------------

entity PB_inverters is port (

	rst_n: in std_logic; 							 -- Active-low reset input
	rst: out std_logic;								 -- Active-high reset output
 	pb_n	: in  std_logic_vector (3 downto 0); -- Active-low push-button inputs
	pb	: out	std_logic_vector(3 downto 0)		 -- Active-high push-button outputs
	
); 
end PB_inverters;



architecture ckt of PB_inverters is

begin

	-- Invert signals
	rst <= NOT(rst_n);
	pb <= NOT(pb_n);

end ckt;