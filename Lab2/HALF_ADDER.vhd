LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY HALF_ADDER is port (
			INPUT_A, INPUT_B	:IN std_logic;
			CARRY_OUTPUT, SUM_OUTPUT	:	OUT std_logic
);
END HALF_ADDER;
ARCHITECTURE simple_gates OF HALF_ADDER IS


BEGIN

CARRY_OUTPUT <= INPUT_B AND INPUT_A;
SUM_OUTPUT <= INPUT_B XOR INPUT_A;

END simple_gates;
