library ieee;
use ieee.std_logic_1164.all;


entity Compx4 is port (
	in_a, in_b :IN std_logic_vector(3 downto 0);
	a_greater_b, a_equal_b, a_less_b	:	OUT std_logic
	); 
end Compx4;

architecture comp_arc4 of Compx4 is

	component Compx1 is port (
			in_a, in_b	:IN std_logic;
			a_greater_b, a_equal_b, a_less_b	:	OUT std_logic
	); 
	end component;

	signal AGTB, AEQB, ALTB : std_logic_vector(3 downto 0);
	
begin

	INST1: Compx1 port map (in_a(0), in_b(0), AGTB(0), AEQB(0), ALTB(0));
	INST2: Compx1 port map (in_a(1), in_b(1), AGTB(1), AEQB(1), ALTB(1));
	INST3: Compx1 port map (in_a(2), in_b(2), AGTB(2), AEQB(2), ALTB(2));
	INST4: Compx1 port map (in_a(3), in_b(3), AGTB(3), AEQB(3), ALTB(3));
	
	a_greater_b <= AGTB(3) OR (AEQB(3) AND AGTB(2)) OR (AEQB(3) AND AEQB(2) AND AGTB(1)) OR (AEQB(3) AND AEQB(2) AND AEQB(1) AND AGTB(0));
	a_less_b <= ALTB(3) OR (AEQB(3) AND ALTB(2)) OR (AEQB(3) AND AEQB(2) AND ALTB(1)) OR (AEQB(3) AND AEQB(2) AND AEQB(1) AND ALTB(0));
	a_equal_b <= AEQB(3) AND AEQB(2) AND AEQB(1) AND AEQB(0);

end comp_arc4;
