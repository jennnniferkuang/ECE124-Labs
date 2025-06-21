--library ieee;
--use ieee.std_logic_1164.all;
--
---- clk input is the logicalstep 50MHz clock input
--
--
----initial default value must start at mid-scale(Hex 7)
--
--entity HVAC is
--
--	port
--	(
--		HVAC_SIM : IN boolean; --temp out changes at a rate 1 degree every 330 msec ; used to direct the HVAC operation for simulation HVAC_SIM:=TRUE
--		clk : in std_logic;
--		run : in std_logic; -- HVAC will only turn on when run is active
--		increase, decrease : in std_logic;
--		temp : out std_logic_vector(3 downto 0) --changes according to which of two qualifier signals (increase or decrease) is active with run also being active
--	
--		--limits of temp 0000 and 1111
--	);
--	
--end entity;
--	
--architecture rtl of HVAC is  --Heating, Ventilation and Air Conditioning 
--	signal clk_2hz : std_logic;
--	signal HVAC_clock : std_logic;
--	signal digital_counter : std_logic_vector(23 downto 0);
--	
--	
--	
--begin
--
--
----clk_divider process generates a 2Hz Clck from the 50 Mhz clk
--	clk_divider: process (clk)
--		variable counter: unsigned(23 downto 0);
--		
--		begin
--		
--		--Synchronously update counter
--			if (rising_edge (clk)) then
--						counter := counter + 1;
--			end if;
--			
--			
--			digital_counter <= std_logic_vector(counter);
--			
--			
--	end process;
--		
--
--	clk_2hz <= digital_counter(23);
--
--	clk_mux: process (HVAC_SIM)
--
--	begin 
--		if (HVAC_SIM) then
--		
--				HVAC_clock <= clk;
--				
--		else
--				HVAC_clock <= clk_2hz;
--				
--		end if;
--		
--	end process;
--	
--	
--	
--counter: process (HVAC_clock)
--
--	variable cnt : unsigned(3 downto 0) := "0111";
--	begin
--	
--	
--	--synchronously update counter 
--		IF ((rising_edge(HVAC_clock))	AND (run = '1')) then 
--			IF ((increase = '1') AND (cnt <	"1111"))	then 
--			cnt := cnt + 1 ;
--			
--			ELSIF ((decrease = '1')AND (cnt > "0000")) then
--			cnt := cnt - 1 ;
--			
--			END IF; 
--		END IF;
--		
--	
--	
--	--Output the current count
--		temp <= std_logic_vector(cnt);
--	
--	end process;
--	
--end rtl;
--
--entity energy_monitor is port (
--	LT_desired, GT_desired, EQ_desired, vacation_mode, MC_test_mode, window_open, door_open: in  std_logic;
--	furnace, at_temp, AC, blower, window, door, vacation, run, increase, decrease: out	std_logic							 
--	); 
--end energy_monitor;
--
--architecture monitor of energy_monitor is
--
--signal mux_temp, curr_temp: std_logic;
--
--begin
--
--	NRG_monitor: process (window_open, door_open, MC_test_mode) is
--	begin
--	
--		if (EQ_desired = '1') then at_temp <= '1';
--		else at_temp <= '0';
--		end if;
--		
--		if (LT_desired = '1') then furnace <= '1';
--		else furnace <= '0';
--		end if;
--		
--		if (GT_desired = '1') then AC <= '1';
--		else AC <= '0';
--		end if;
--		
--		if (vacation_mode = '1') then vacation <= '1';
--		else vacation <= '0';
--		end if;
--		
--		if (window_open = '1') then window <= '1';
--		else window <= '0';
--		end if;
--		
--		if (door_open = '1') then door <= '1';
--		else door <= '0';
--		end if;
--		
--		if ((EQ_desired = '0') and (MC_test_mode = '0') and (window_open = '0') and (door_open = '0')) then
--			run <= '1';
--			blower <= '1';
--			
--			if (LT_desired = '1') then increase <= '1';
--			
--			elsif (GT_desired = '1') then decrease <= '1';
--			
--			end if;
--		
--		else
--			run <= '0';
--			blower <= '0';
--			increase <= '0';
--			decrease <= '0';
--		
--		end if;
--
--	end process;
--
--end monitor;

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--declaring inputs and outputs for 1bit comparator 
entity Energy_monitor is port (
   
	AGTB, AEQB, ALTB, vacation_mode, MC_test_mode, window_open, door_open: in  std_logic;  --inputs
   furnace, at_temp, AC, blower, window, door, vacation, run, increase, decrease :  out std_logic  --outputs -- MIGHT NEED TO SWITCH ORDER

);
end Energy_monitor;


architecture monitor of Energy_monitor IS 



---SIGNALS GO HERE IF WE NEED THEM
--

---vacation_mode, MC_test_mode, window_open, door_open:



---COMPONENTS




signal mux_temp2: std_logic;
signal current_temp2: std_logic;




begin 

Eng_Monitor: PROCESS (window_open, door_open, MC_TEST_mode) is
begin

	if (vacation_mode = '1') then 
		vacation <= '1';
	else
		vacation <= '0';
	end if;
	
	if (window_open = '1') then 
		window <= '1';
	else 
		window <= '0';
	end if;
	
	
		
	if (door_open = '1') then 
		door <= '1';
	else 
		door <= '0';
	end if;
	
	
	if (AGTB = '1') then 
		furnace <= '1';
		
	else 
		furnace <= '0';
		
	end if;
	
	
	if (AEQB = '1') then 
		at_temp <= '1';
		
	else 
		at_temp <= '0';
		
	end if;
	
	if (ALTB = '1') then 
		AC <= '1';
		
	else 
		AC <= '0';
		
	end if;
	
	
	
	
	

	--if (AEQB = '1') then
	--	run = '0';
	--end if;

	if ((window_open = '0') AND (door_open = '0') AND (MC_TEST_mode = '0') AND (AEQB = '0')) then 
		run <= '1'; 
		blower <= '1';
		
		if (AGTB = '1') then 
			increase <= '1';
			decrease <= '0';
				
		elsif (ALTB = '1') then
			decrease <= '1';
			increase <= '0';
		
		else
			increase <= '0';
			decrease <= '0';
			
		end if;

	else  
		blower <= '0';
		run <= '0';
		increase <= '0';
		decrease <= '0';

	end if; 
	
	
END PROCESS; 


end monitor;
		