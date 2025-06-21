library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity LogicalStep_Lab2_top is port (
   clkin_50			: in	std_logic;
	pb_n				: in	std_logic_vector(3 downto 0);
 	sw   				: in  std_logic_vector(7 downto 0); -- The switch inputs
   leds				: out std_logic_vector(7 downto 0); -- for displaying the switch content
   seg7_data 		: out std_logic_vector(6 downto 0); -- 7-bit outputs to a 7-segment
	seg7_char1  	: out	std_logic;				    		-- seg7 digit1 selector
	seg7_char2  	: out	std_logic				    		-- seg7 digit2 selector
	
); 
end LogicalStep_Lab2_top;

architecture SimpleCircuit of LogicalStep_Lab2_top is
--
-- Components Used ---
------------------------------------------------------------------- 
  component SevenSegment port (
   hex   		:  in  std_logic_vector(3 downto 0);   -- The 4 bit data to be displayed
   sevenseg 	:  out std_logic_vector(6 downto 0)    -- 7-bit outputs to a 7-segment
   ); 
   end component;
	
	component segment7_mux port (
		clk  : in std_logic := '0';
		DIN2 : in std_logic_vector(6 downto 0);
		DIN1 : in std_logic_vector(6 downto 0);
		DOUT : out std_logic_vector(6 downto 0);
		DIG2 : out std_logic;
		DIG1 : out std_logic
	);
	end component;
	
	component PB_Inverters port (
		pb_n : IN std_logic_vector(3 downto 0);
		pb   : OUT std_logic_vector(3 downto 0)
	);
	end component;
	
	component logic_processor port (
		logic_in0 : in std_logic_vector(3 downto 0);
		logic_in1 : in std_logic_vector(3 downto 0);
		mux_select: in std_logic_vector(1 downto 0);
		hex_out	 : out std_logic_vector(3 downto 0)
	);
	end component;
	
	component mux_2_to_1 port(
	     operand_A, operand_B   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        logic_select   : IN  STD_LOGIC;
        logic_out   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
	 end component;
	
	component full_adder_4bit port (
		BUS0_B0, BUS1_B0, BUS0_B1, BUS1_B1, BUS0_B2, BUS1_B2, BUS0_B3, BUS1_B3, CARRY_IN	:IN std_logic;
		FULL_CARRY_OUTPUT	:	OUT std_logic;
		SUM : OUT std_logic_vector(3 downto 0)
		);
	end component;
	
-- Create any signals, or temporary variables to be used
--
--  std_logic_vector is a signal which can be used for logic operations such as OR, AND, NOT, XOR
--
	signal seg7_A		: std_logic_vector(6 downto 0);
	signal hex_A		: std_logic_vector(3 downto 0);
	signal seg7_B		: std_logic_vector(6 downto 0);
	signal hex_B		: std_logic_vector(3 downto 0);	
	signal pb			: std_logic_vector(3 downto 0);
	signal hex_sum		: std_logic_vector(3 downto 0);
	signal hex_carry	: std_logic_vector(3 downto 0);
	signal carry : std_logic;
	signal operand_a : std_logic_vector(3 downto 0);
	signal operand_b : std_logic_vector(3 downto 0);
-- Here the circuit begins

begin
hex_A <= sw(3 downto 0);
hex_B <= sw(7 downto 4);
--seg7_data <= seg7_A;

--INST1: sevenSegment port map(hex_A, seg7_A);
--INST2: sevenSegment port map(hex_B, seg7_B);
INST3: segment7_mux port map(clkin_50, seg7_A, seg7_B, seg7_data, seg7_char1, seg7_char2);
INST4: PB_Inverters port map(pb_n, pb);
INST5: logic_processor port map(hex_B, hex_A, pb(1 downto 0), leds(3 downto 0));
INST6: full_adder_4bit port map(hex_A(0), hex_B(0), hex_A(1), hex_B(1), hex_A(2), hex_B(2), hex_A(3), hex_B(3), '0', carry, hex_sum);

hex_carry <= "000" & carry;

INST7: sevenSegment port map(operand_a, seg7_B);
INST8: sevenSegment port map(operand_b, seg7_A);

INST1: mux_2_to_1 port map(hex_b, hex_carry, pb(2), operand_b);
INST2: mux_2_to_1 port map(hex_a, hex_sum, pb(2), operand_a);
 
end SimpleCircuit;

