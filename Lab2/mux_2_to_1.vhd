LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_2_to_1 IS
    PORT (
        operand_A, operand_B   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        logic_select   : IN  STD_LOGIC;
        logic_out   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END mux_2_to_1;

ARCHITECTURE mux_logic OF mux_2_to_1 IS
BEGIN

		with logic_select select
		logic_out <= operand_A when '0',
		operand_B when '1';

END mux_logic;
