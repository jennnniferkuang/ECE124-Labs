LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY full_adder_4bit is port (
			BUS0_B0, BUS1_B0, BUS0_B1, BUS1_B1, BUS0_B2, BUS1_B2, BUS0_B3, BUS1_B3, CARRY_IN	:IN std_logic;
			FULL_CARRY_OUTPUT	:	OUT std_logic;
			SUM : OUT std_logic_vector(3 downto 0)
);
END full_adder_4bit;
ARCHITECTURE simple_gates_full OF full_adder_4bit IS


	component full_adder_1bit port (
		INPUT_A : IN std_logiC;
		INPUT_B : IN std_logiC;
		CARRY_IN : IN std_logic;
		FULL_SUM_OUTPUT   : OUT std_logic;
		FULL_CARRY_OUTPUT   : OUT std_logic
		);
	end component;
	SIGNAL FULL_SUM, CARRY0, CARRY1, CARRY2 : STD_LOGIC;

begin

INST1: full_adder_1bit PORT MAP(BUS0_B0, BUS1_B0, CARRY_IN, SUM(0), CARRY0);
INST2: full_adder_1bit PORT MAP(BUS0_B1, BUS1_B1, CARRY0, SUM(1), CARRY1);
INST3: full_adder_1bit PORT MAP(BUS0_B2, BUS1_B2, CARRY1, SUM(2), CARRY2);
INST4: full_adder_1bit PORT MAP(BUS0_B3, BUS1_B3, CARRY2, SUM(3), FULL_CARRY_OUTPUT);

end simple_gates_full;