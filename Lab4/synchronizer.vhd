
-- Section 205 Group 6 : Jennifer Kuang, Nur Iscan

library ieee;
use ieee.std_logic_1164.all;

---------------------------------------------------------------
-- 	Synchronizes asynchronous input signal to the clock    --
---------------------------------------------------------------

entity synchronizer is port (

		clk   : in std_logic;  -- System clock
		reset : in std_logic;  -- Asynchronous reset
		din   : in std_logic;  -- Asynchronous input signal
		dout  : out std_logic  -- Synchronized output signal

);
end synchronizer;



architecture circuit of synchronizer is

		signal sreg : std_logic_vector(1 downto 0);  -- Two-stage synchronization register

begin

	process(clk) begin 
		
		if (rising_edge(clk)) then
			-- Store input, clearing if reset is active
			sreg(0) <= (not reset AND din);
			-- Use current state to determine next state, mitigate metastability
			sreg(1) <= (not reset AND sreg(0));
			
		end if;
	end process;
	
	-- Output synchronized signal
	dout <= sreg(1);

end;
