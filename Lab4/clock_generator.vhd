library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- mode is the boolean input to select the clocking outputs for LogicalStep board OR simulation operation
-- clk input is the LogicalStep 50MHz clock input
-- sm_clock is to be connected to the state mackine and other registers in the pipeline (0.7 Hz in real time)
-- blink_clock is used for the blinking indicators only (2.8 Hz in real time)

entity Clock_generator is

	port
	(
		 sim_mode			: in boolean;		-- used to select the clocking frequency for the output signals "sm_clken" and "blink".
		 reset				: in std_logic;
       clkin      		: in  std_logic; -- input used for counter and register clocking
		 sm_clken			: out	std_logic; -- output used to enbl the sm to advance by 1 clk.
		 blink		  		: out std_logic  -- output used for blink signal (1/4 the rate of the sm_clken)
	);

end entity;

architecture rtl of Clock_generator is

signal digital_counter 					: std_logic_vector(25 downto 0);
signal clk_0_7hz, clk_2_8hz					: std_logic;
signal sim_clk_blink, sim_clk_enbl	: std_logic;

signal clk_reg_extend					: std_logic_vector(1 downto 0); -- pipeline used to create a single clock enable pulse signal
signal blink_sig 							: std_logic;


begin

-- clk_divider process generates a free-running Clock_enbl signal and a blink signal from the 50 Mhz clk

clk_divider: process (clkin)
	variable   counter	:  unsigned(25 downto 0);
	
	begin
-- Synchronously update counter
		if (rising_edge(clkin))  then
			if(reset ='1') then
				counter := "00000000000000000000000000";
			else
				 counter :=  counter + 1;
			end if;
		end if;
		
		digital_counter <= std_logic_vector(counter);		

	end process;
	
clk_0_7hz 				<= digital_counter(25); -- clk_0_7Hz is about 0.7 Hz 
clk_2_8hz 				<= digital_counter(23); -- clk_2_8Hz is about 2.8 Hz
sim_clk_enbl 			<= digital_counter(4);  -- clk_enbl used in simulations
sim_clk_blink 			<= digital_counter(2);  -- clk_blink used in simulations

clk_extender: process (clkin)				   -- clk_extender is an extra pair of serial registers used to create a single one-cycle enable pulse for the state machine
	begin
		if (rising_edge(clkin))  then
			if(reset ='1') then
				clk_reg_extend(1 downto 0) 	<= "00";
				blink_sig 				 			<= '0';
			elsif(sim_mode) then
				 clk_reg_extend(1 downto 0) 	<= clk_reg_extend(0) & sim_clk_enbl;-- clock register input signal used for simulations
				 blink_sig 		 					<= sim_clk_blink;							-- blink signal input used for blinking in simulations
			else 
				 clk_reg_extend(1 downto 0) 	<= clk_reg_extend(0) & clk_0_7hz ; 	-- clock register input signal used for 0.7Hz clock enbl for LogicalStep Board downloads
				 blink_sig 				 			<= clk_2_8hz;           				-- blink signal input used for LogicalStep Board downloads
				END IF;
		end if;
	end process;

sm_clken	<= clk_reg_extend(0) AND (NOT(clk_reg_extend(1)));
blink 	<= blink_sig;

end rtl;
