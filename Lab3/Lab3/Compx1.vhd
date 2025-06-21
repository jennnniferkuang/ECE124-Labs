library ieee;
use ieee.std_logic_1164.all;


entity Compx1 is port (
			in_a, in_b	:IN std_logic;
			a_greater_b, a_equal_b, a_less_b	:	OUT std_logic
	); 
end Compx1;

architecture comp_arc of Compx1 is
begin

	a_greater_b <= ((NOT in_a) NOR in_b); --'1' WHEN (in_a NOR in_b = '1')	ELSE '0';
	a_equal_b <= (in_a XNOR in_b);
	a_less_b <= (in_a NOR (NOT in_b));

end comp_arc;
