
--Jennifer Kuang and Nur Iscan, Group 6, ECE124

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY PB_Inverters IS
PORT
(
	pb_n : IN std_logic_vector(3 downto 0); -- 4-bit input
	pb3, pb2, pb1, pb0   : OUT std_logic -- 4-bit output
);
END PB_Inverters;

ARCHITECTURE gates OF PB_Inverters IS

BEGIN

-- Inverts from ACTIVE_LOW to ACTIVE_HIGH
pb3 <= not(pb_n(3));
pb2 <= not(pb_n(2));
pb1 <= not(pb_n(1));
pb0 <= not(pb_n(0));

END gates;