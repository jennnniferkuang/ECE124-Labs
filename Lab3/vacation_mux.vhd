library ieee;
use ieee.std_logic_1164.all;


entity vacation_mux is port (
	desired_temp, vacation_temp: in  std_logic_vector(3 downto 0);
	vacation_mode: in	std_logic;
	mux_temp: out  std_logic_vector(3 downto 0)
	); 
end vacation_mux;

architecture mux_logic of vacation_mux is

begin

	with vacation_mode select
		mux_temp <= desired_temp when '0',
						vacation_temp when '1';

end mux_logic;