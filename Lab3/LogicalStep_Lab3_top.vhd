library ieee;
use ieee.std_logic_1164.all;


entity LogicalStep_Lab3_top is port (
	clkin_50		: in 	std_logic;
	pb_n			: in	std_logic_vector(3 downto 0);
 	sw   			: in  std_logic_vector(7 downto 0); 	
	
	----------------------------------------------------
--	HVAC_temp : out std_logic_vector(3 downto 0); -- used for simulations only. Comment out for FPGA download compiles.
	----------------------------------------------------
	
   leds			: out std_logic_vector(7 downto 0);
   seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  : out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  : out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab3_top;

architecture design of LogicalStep_Lab3_top is
--
-- Provided Project Components Used
------------------------------------------------------------------- 

component SevenSegment  port (
   hex	   :  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg :  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
); 
end component SevenSegment;

component segment7_mux port (
          clk        : in  std_logic := '0';
			 DIN2 		: in  std_logic_vector(6 downto 0);	
			 DIN1 		: in  std_logic_vector(6 downto 0);
			 DOUT			: out	std_logic_vector(6 downto 0);
			 DIG2			: out	std_logic;
			 DIG1			: out	std_logic
        );
end component segment7_mux;


	
component Tester port (
 MC_TESTMODE				: in  std_logic;
 I1EQI2,I1GTI2,I1LTI2	: in	std_logic;
	input1					: in  std_logic_vector(3 downto 0);
	input2					: in  std_logic_vector(3 downto 0);
	TEST_PASS  				: out	std_logic							 
	); 
	end component;
--	
component HVAC 	port (
	HVAC_SIM					: in boolean;
	clk						: in std_logic; 
	run		   			: in std_logic;
	increase, decrease	: in std_logic;
	temp						: out std_logic_vector (3 downto 0)
	);
end component;
------------------------------------------------------------------
-- Add any Other Components here
------------------------------------------------------------------

component Compx4 is port (
	in_a, in_b :IN std_logic_vector(3 downto 0);
	a_greater_b, a_equal_b, a_less_b	:	OUT std_logic
	); 
end component;

component Bidir_shift_reg is port(
	 CLK				:IN std_logic := '0';
	 RESET			:IN std_logic := '0';
	 CLK_EN			:IN std_logic := '0';
	 LEFTTO_RIGHT1			:IN std_logic := '0';
	 REG_BITS			:OUT std_logic_vector(7 downto 0)
	 );
end component;

component U_D_Bin_Counter8bit is port(
	CLK:		in std_logic;
	RESET : in std_logic;
	CLK_EN: in std_logic;
	UP1_DOWN0 : in std_logic;
	COUNTER_BITS: out std_logic_vector(7 downto 0)
	);
end component;

component vacation_mux is port (
	desired_temp, vacation_temp: in  std_logic_vector(3 downto 0);
	vacation_mode: in	std_logic;
	mux_temp: out  std_logic_vector(3 downto 0)				 
	); 
end component;

component Energy_monitor is port (
	AGTB, AEQB, ALTB, vacation_mode, MC_test_mode, window_open, door_open: in  std_logic;  --inputs
   furnace, at_temp, AC, blower, window, door, vacation, run, increase, decrease :  out std_logic  --outputs -- MIGHT NEED TO SWITCH ORDER
	); 
end component;

component PB_Inverters IS PORT (
	pb_n : IN std_logic_vector(3 downto 0); -- 4-bit input
	pb3, pb2, pb1, pb0   : OUT std_logic -- 4-bit output
);
END component;

------------------------------------------------------------------	
-- Create any additional internal signals to be used
------------------------------------------------------------------	
constant HVAC_SIM : boolean := FALSE; -- set to FALSE when compiling for FPGA download to LogicalStep board 
                                      -- or TRUE for doing simulations with the HVAC Component
------------------------------------------------------------------	

-- global clock
signal clk_in					: std_logic;
signal hex_A, hex_B 			: std_logic_vector(3 downto 0);
signal hexA_7seg, hexB_7seg: std_logic_vector(6 downto 0);

signal pb: std_logic_vector (3 downto 0);

signal LT_desired, EQ_desired, GT_desired: std_logic;
signal mux_temp, curr_temp, desired_temp, vacation_temp: std_logic_vector(3 downto 0);

signal run, increase, decrease, vacation_mode, MC_test_mode, window_open, door_open: std_logic;

------------------------------------------------------------------- 
begin -- Here the circuit begins

clk_in <= clkin_50;	--hook up the clock input

-- temp inputs hook-up to internal busses.
desired_temp <= sw(3 downto 0);
vacation_temp <= sw(7 downto 4);

INST1: sevensegment port map (mux_temp, hexA_7seg);
INST2: sevensegment port map (curr_temp, hexB_7seg);
INST3: segment7_mux port map (clk_in, hexA_7seg, hexB_7seg, seg7_data, seg7_char2, seg7_char1);
--INST4: Compx4 port map (hex_A, hex_B, leds(2), leds(1), leds(0));
--INST5: Bidir_shift_reg port map (clk_in, NOT(pb_n(0)), sw(0), sw(1), leds(7 downto 0));
--INST6: U_D_Bin_Counter8bit port map (clk_in, NOT(pb_n(0)), sw(0), sw(1), leds(7 downto 0));
INST7: Compx4 port map (mux_temp, curr_temp, LT_desired, EQ_desired, GT_desired);
INST8: PB_Inverters port map (pb_n (3 downto 0), vacation_mode, MC_test_mode, window_open, door_open);
INST9: vacation_mux port map (desired_temp, vacation_temp, vacation_mode, mux_temp);
INST10: energy_monitor port map (LT_desired, EQ_desired, GT_desired, vacation_mode, MC_test_mode, window_open, door_open, leds(0), leds(1), leds(2), leds(3), leds(4), leds(5), leds(7), run, increase, decrease);
INST11: HVAC port map (HVAC_SIM, clk_in, run, increase, decrease, curr_temp);
INST12: Tester port map (MC_test_mode, EQ_desired, LT_desired, GT_desired, desired_temp, curr_temp, leds(6));
		
end design;

