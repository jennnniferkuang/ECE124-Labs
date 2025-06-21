
-- Section 205 Group 6 : Jennifer Kuang, Nur Iscan

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

---------------------------------------------------------------
-- 							Top level design 							 --
---------------------------------------------------------------

ENTITY logicStep_lab4_waveform_top IS PORT (
		clkin_50		: in	std_logic;							-- The 50 MHz FPGA Clockinput
		rst_n			: in	std_logic;							-- The RESET input (ACTIVE LOW)
		pb_n			: in	std_logic_vector(3 downto 0); -- The push-button inputs (ACTIVE LOW)
		sw   			: in  std_logic_vector(7 downto 0); -- The switch inputs
		leds			: out std_logic_vector(7 downto 0);	-- for displaying the the lab4 project details
		
	-------------------------------------------------------------
	-- you can add temporary output ports here if you need to debug your design 
	-- or to add internal signals for your simulations
	-------------------------------------------------------------
		
		seg7_data 	: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
		seg7_char1  : out	std_logic;							-- seg7 digi selectors
		seg7_char2  : out	std_logic;							-- seg7 digi selectors
		
	-------------------------------------------------------------
	-- Simulation Signals
	-------------------------------------------------------------
		sm_clken       : buffer std_logic;
		blink_sig      : buffer std_logic;
		gsolidNS       : buffer std_logic;
		ysolidNS       : buffer std_logic;
		rsolidNS       : buffer std_logic;
		gsolidEW       : buffer std_logic;
		ysolidEW       : buffer std_logic;
		rsolidEW       : buffer std_logic
		
	
	);
END logicStep_lab4_waveform_top;



ARCHITECTURE SimpleCircuit OF logicStep_lab4_waveform_top IS

	-- 7-segment multiplexer
   component segment7_mux port (
         clk      	   : in  std_logic := '0';
			DIN2 				: in  std_logic_vector(6 downto 0);	--bits 6 to 0 represent segments G,F,E,D,C,B,A
			DIN1 				: in  std_logic_vector(6 downto 0); --bits 6 to 0 represent segments G,F,E,D,C,B,A
			DOUT				: out	std_logic_vector(6 downto 0);
			DIG2				: out	std_logic;
			DIG1				: out	std_logic
   );
   end component;

	-- Clock generator
   component clock_generator port (
			sim_mode			: in boolean;
			reset				: in std_logic;
         clkin      		: in  std_logic;
			sm_clken			: out	std_logic;
			blink		  		: out std_logic
   );
   end component;

	-- Push-button inverters
   component pb_inverters port (
			rst_n				: in std_logic;
			rst				: out std_logic;
			pb_n 				: in std_logic_vector(3 downto 0);
			pb 				: out std_logic_vector(3 downto 0)
   );
   end component;

	-- Synchronizer
	component synchronizer port(
			clk				: in std_logic;
			reset				: in std_logic;
			din				: in std_logic;
			dout				: out std_logic
   );
   end component;
	
	
	-- Pedestrian crossing request holding register
	component holding_register port (
		clk					: in std_logic;
		reset					: in std_logic;
		register_clr		: in std_logic;
		din					: in std_logic;
		dout					: out std_logic
   );
   end component;
  
   -- Push-button filters
	component PB_filters port (
		clkin					: in std_logic;
		rst_n					: in std_logic;
		rst_n_filtered		: out std_logic;
		pb_n					: in  std_logic_vector (3 downto 0);
		pb_n_filtered		: out	std_logic_vector(3 downto 0)							 
	); 
	end component;

	-- State machine (Moore)
	component State_Machine_Moore  port (
		clk_input 			: in std_logic;
		reset					: in std_logic;
		enable				: in std_logic;
		blink_sig			: in std_logic;
		NSrequest			: in std_logic;
		EWrequest			: in std_logic;
		offline				: in std_logic;
		greenNS				: out std_logic;
		yellowNS				: out std_logic;
		redNS					: out std_logic;
		greenEW				: out std_logic;
		yellowEW				: out std_logic;
		redEW					: out std_logic;
		NS_CROSSINGS		: out std_logic;
		EW_CROSSINGS		: out std_logic;
		NS_REGISTER_CLEAR	: out std_logic;
		EW_REGISTER_CLEAR	: out std_logic;
		stateout				: out std_logic_vector(3 downto 0)
	);
	end component;

----------------------------------------------------------------------------------------------------
	CONSTANT	sim_mode						: boolean := TRUE; -- set to FALSE for LogicalStep board downloads
	                                                     -- set to TRUE for SIMULATIONS
	
--	signal sm_clken, blink_sig 		: std_logic; 							-- Comment out for simulations
	signal pb								: std_logic_vector (3 downto 0);
	signal pb_filt							: std_logic_vector (3 downto 0);
	signal rst								: std_logic;
	signal rst_in							: std_logic;
	signal rst_n_fil						: std_logic;
	signal synch_rst						: std_logic;
	signal sync_out 						: std_logic_vector (1 downto 0);
	
	-- Light signals for North-South crossing
--	signal gsolidNS						: std_logic;
--	signal ysolidNS						: std_logic;
--	signal rsolidNS						: std_logic;
	signal lightNS							: std_logic_vector (6 downto 0);

	-- Light signals for East-West crossing
--	signal gsolidEW						: std_logic;
--	signal ysolidEW						: std_logic;
--	signal rsolidEW						: std_logic;
	signal lightEW							: std_logic_vector (6 downto 0);
	
	signal NS_CROSSING, EW_CROSSING	: std_logic;
	signal NS_REQUEST 					: std_logic;
	signal EW_REQUEST 					: std_logic;
	signal NS_REGISTER_CLR 				: std_logic;
	signal EW_REGISTER_CLR 				: std_logic;

	
BEGIN

	-- Connect output values to leds
	leds(0)<= NS_CROSSING;
	leds(2)<= EW_CROSSING;
	leds(1)<= NS_REQUEST;
	leds(3) <= EW_REQUEST;
 
	-- Concatenate to 7-segment digit
	lightNS <=  ysolidNS & "00" & gsolidNS & "00" & rsolidNS;
	lightEW <=  ysolidEW & "00" & gsolidEW & "00" & rsolidEW;

----------------------------------------------------------------------------------------------------

	INST1: pb_inverters			port map (rst_n_fil, rst, pb_filt, pb);
	INST2: clock_generator 		port map (sim_mode, pb(3), clkin_50, sm_clken, blink_sig);
	INST3: PB_filters 			port map (clkin_50, rst_n, rst_n_fil, pb_n, pb_filt);
	INST4: synchronizer			port map	(clkin_50, synch_rst, rst, synch_rst);

	-- EW crossing request
	INST5: synchronizer 			port map	(clkin_50, synch_rst, pb(1), sync_out(1));
	INST6: holding_register 	port map (clkin_50, synch_rst, EW_REGISTER_CLR, sync_out(1), EW_REQUEST);--leds(1)

	-- NS crossing request
	INST7: synchronizer 			port map (clkin_50, synch_rst, pb(0), sync_out(0));
	INST8: holding_register 	port map	(clkin_50, synch_rst, NS_REGISTER_CLR, sync_out(0), NS_REQUEST); --leds(3)

	INST9: State_Machine_moore PORT MAP(clkin_50, synch_rst, sm_clken, blink_sig, NS_REQUEST, EW_REQUEST, sw(0), 
													gsolidNS, ysolidNS, rsolidNS,  gsolidEW, ysolidEW, rsolidEW, NS_CROSSING, 
													EW_CROSSING, NS_REGISTER_CLR, EW_REGISTER_CLR, leds(7 downto 4));
													
	INST10: segment7_mux 		port map(clkin_50, lightEW, lightNS, seg7_data (6 downto 0), seg7_char1, seg7_char2); 

END SimpleCircuit;