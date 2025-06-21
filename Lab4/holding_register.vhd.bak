
-- Section 205 Group 6 : Jennifer Kuang, Nur Iscan

library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------------------
-- Holds pedestrian crossing requests until they are cleared --
---------------------------------------------------------------

entity holding_register is port (

		clk          : in std_logic;  -- System clock
		reset        : in std_logic;  -- Asynchronous reset, clears the register
		register_clr : in std_logic;  -- Clears the stored request when processing is complete
		din          : in std_logic;  -- New pedestrian crossing request input
		dout         : out std_logic  -- Output signal indicating an active request
		
 );
 end holding_register;
 
 
 
architecture circuit of holding_register is

	Signal sreg				: std_logic;  -- Internal register to store the pedestrian request

BEGIN

	process(clk) begin
	
		if (rising_edge(clk)) then
		
			if (reset = '1') then
				-- Clear the register if reset is active
				sreg <= '0';
				
			else 
				-- Store request: Keep request active if it was already set (sreg OR din)
				-- Clear the request when register_clr OR reset is active
				sreg <= ((sreg OR din) AND NOT (register_clr OR reset));
				
			end if;
		end if;
	end process;
	
	-- Output the stored pedestrian request state
	dout <= sreg;

END;