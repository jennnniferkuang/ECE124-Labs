-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "03/06/2025 22:22:29"

-- 
-- Device: Altera 10M08SAE144C8G Package EQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LogicalStep_Lab3_top IS
    PORT (
	clkin_50 : IN std_logic;
	pb_n : IN std_logic_vector(3 DOWNTO 0);
	sw : IN std_logic_vector(7 DOWNTO 0);
	leds : OUT std_logic_vector(7 DOWNTO 0);
	seg7_data : OUT std_logic_vector(6 DOWNTO 0);
	seg7_char1 : OUT std_logic;
	seg7_char2 : OUT std_logic
	);
END LogicalStep_Lab3_top;

ARCHITECTURE structure OF LogicalStep_Lab3_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clkin_50 : std_logic;
SIGNAL ww_pb_n : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_seg7_data : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg7_char1 : std_logic;
SIGNAL ww_seg7_char2 : std_logic;
SIGNAL \pb_n[1]~input_o\ : std_logic;
SIGNAL \pb_n[2]~input_o\ : std_logic;
SIGNAL \pb_n[3]~input_o\ : std_logic;
SIGNAL \seg7_data[1]~output_o\ : std_logic;
SIGNAL \seg7_data[5]~output_o\ : std_logic;
SIGNAL \seg7_data[6]~output_o\ : std_logic;
SIGNAL \leds[0]~output_o\ : std_logic;
SIGNAL \leds[1]~output_o\ : std_logic;
SIGNAL \leds[2]~output_o\ : std_logic;
SIGNAL \leds[3]~output_o\ : std_logic;
SIGNAL \leds[4]~output_o\ : std_logic;
SIGNAL \leds[5]~output_o\ : std_logic;
SIGNAL \leds[6]~output_o\ : std_logic;
SIGNAL \leds[7]~output_o\ : std_logic;
SIGNAL \seg7_data[0]~output_o\ : std_logic;
SIGNAL \seg7_data[2]~output_o\ : std_logic;
SIGNAL \seg7_data[3]~output_o\ : std_logic;
SIGNAL \seg7_data[4]~output_o\ : std_logic;
SIGNAL \seg7_char1~output_o\ : std_logic;
SIGNAL \seg7_char2~output_o\ : std_logic;
SIGNAL \sw[0]~input_o\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \sw[2]~input_o\ : std_logic;
SIGNAL \sw[3]~input_o\ : std_logic;
SIGNAL \INST1|Mux5~0_combout\ : std_logic;
SIGNAL \sw[4]~input_o\ : std_logic;
SIGNAL \sw[5]~input_o\ : std_logic;
SIGNAL \sw[6]~input_o\ : std_logic;
SIGNAL \sw[7]~input_o\ : std_logic;
SIGNAL \INST2|Mux5~0_combout\ : std_logic;
SIGNAL \clkin_50~input_o\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[0]~0_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[0]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[1]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[1]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[1]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[2]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[2]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[2]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[3]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[3]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[3]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[4]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[4]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[4]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[5]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[5]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[5]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[6]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[6]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[6]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[7]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[7]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[7]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[8]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[8]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[8]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[9]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[9]~q\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[9]~2\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[10]~1_combout\ : std_logic;
SIGNAL \INST3|clk_proc:COUNT[10]~q\ : std_logic;
SIGNAL \INST3|DOUT_TEMP[1]~0_combout\ : std_logic;
SIGNAL \INST1|Mux1~0_combout\ : std_logic;
SIGNAL \INST2|Mux1~0_combout\ : std_logic;
SIGNAL \INST3|DOUT_TEMP[5]~1_combout\ : std_logic;
SIGNAL \INST1|Mux0~0_combout\ : std_logic;
SIGNAL \INST2|Mux0~0_combout\ : std_logic;
SIGNAL \INST3|DOUT_TEMP[6]~2_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[0]~8_combout\ : std_logic;
SIGNAL \pb_n[0]~input_o\ : std_logic;
SIGNAL \INST6|ud_bin_counter[0]~10_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[0]~9\ : std_logic;
SIGNAL \INST6|ud_bin_counter[1]~11_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[1]~12\ : std_logic;
SIGNAL \INST6|ud_bin_counter[2]~13_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[2]~14\ : std_logic;
SIGNAL \INST6|ud_bin_counter[3]~15_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[3]~16\ : std_logic;
SIGNAL \INST6|ud_bin_counter[4]~17_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[4]~18\ : std_logic;
SIGNAL \INST6|ud_bin_counter[5]~19_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[5]~20\ : std_logic;
SIGNAL \INST6|ud_bin_counter[6]~21_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter[6]~22\ : std_logic;
SIGNAL \INST6|ud_bin_counter[7]~23_combout\ : std_logic;
SIGNAL \INST1|Mux6~0_combout\ : std_logic;
SIGNAL \INST2|Mux6~0_combout\ : std_logic;
SIGNAL \INST3|DOUT[0]~0_combout\ : std_logic;
SIGNAL \INST1|Mux4~0_combout\ : std_logic;
SIGNAL \INST2|Mux4~0_combout\ : std_logic;
SIGNAL \INST3|DOUT[2]~2_combout\ : std_logic;
SIGNAL \INST1|Mux3~0_combout\ : std_logic;
SIGNAL \INST2|Mux3~0_combout\ : std_logic;
SIGNAL \INST3|DOUT[3]~3_combout\ : std_logic;
SIGNAL \INST1|Mux2~0_combout\ : std_logic;
SIGNAL \INST2|Mux2~0_combout\ : std_logic;
SIGNAL \INST3|DOUT[4]~4_combout\ : std_logic;
SIGNAL \INST6|ud_bin_counter\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \INST3|ALT_INV_clk_proc:COUNT[10]~q\ : std_logic;
SIGNAL \ALT_INV_pb_n[0]~input_o\ : std_logic;
SIGNAL \INST3|ALT_INV_DOUT[4]~4_combout\ : std_logic;
SIGNAL \INST3|ALT_INV_DOUT[3]~3_combout\ : std_logic;
SIGNAL \INST3|ALT_INV_DOUT[2]~2_combout\ : std_logic;
SIGNAL \INST3|ALT_INV_DOUT[0]~0_combout\ : std_logic;

BEGIN

ww_clkin_50 <= clkin_50;
ww_pb_n <= pb_n;
ww_sw <= sw;
leds <= ww_leds;
seg7_data <= ww_seg7_data;
seg7_char1 <= ww_seg7_char1;
seg7_char2 <= ww_seg7_char2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\INST3|ALT_INV_clk_proc:COUNT[10]~q\ <= NOT \INST3|clk_proc:COUNT[10]~q\;
\ALT_INV_pb_n[0]~input_o\ <= NOT \pb_n[0]~input_o\;
\INST3|ALT_INV_DOUT[4]~4_combout\ <= NOT \INST3|DOUT[4]~4_combout\;
\INST3|ALT_INV_DOUT[3]~3_combout\ <= NOT \INST3|DOUT[3]~3_combout\;
\INST3|ALT_INV_DOUT[2]~2_combout\ <= NOT \INST3|DOUT[2]~2_combout\;
\INST3|ALT_INV_DOUT[0]~0_combout\ <= NOT \INST3|DOUT[0]~0_combout\;

\seg7_data[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \INST3|DOUT_TEMP[1]~0_combout\,
	devoe => ww_devoe,
	o => \seg7_data[1]~output_o\);

\seg7_data[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \INST3|DOUT_TEMP[5]~1_combout\,
	devoe => ww_devoe,
	o => \seg7_data[5]~output_o\);

\seg7_data[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \INST3|DOUT_TEMP[6]~2_combout\,
	devoe => ww_devoe,
	o => \seg7_data[6]~output_o\);

\leds[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(0),
	devoe => ww_devoe,
	o => \leds[0]~output_o\);

\leds[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(1),
	devoe => ww_devoe,
	o => \leds[1]~output_o\);

\leds[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(2),
	devoe => ww_devoe,
	o => \leds[2]~output_o\);

\leds[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(3),
	devoe => ww_devoe,
	o => \leds[3]~output_o\);

\leds[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(4),
	devoe => ww_devoe,
	o => \leds[4]~output_o\);

\leds[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(5),
	devoe => ww_devoe,
	o => \leds[5]~output_o\);

\leds[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(6),
	devoe => ww_devoe,
	o => \leds[6]~output_o\);

\leds[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST6|ud_bin_counter\(7),
	devoe => ww_devoe,
	o => \leds[7]~output_o\);

\seg7_data[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|ALT_INV_DOUT[0]~0_combout\,
	devoe => ww_devoe,
	o => \seg7_data[0]~output_o\);

\seg7_data[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|ALT_INV_DOUT[2]~2_combout\,
	devoe => ww_devoe,
	o => \seg7_data[2]~output_o\);

\seg7_data[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|ALT_INV_DOUT[3]~3_combout\,
	devoe => ww_devoe,
	o => \seg7_data[3]~output_o\);

\seg7_data[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|ALT_INV_DOUT[4]~4_combout\,
	devoe => ww_devoe,
	o => \seg7_data[4]~output_o\);

\seg7_char1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|ALT_INV_clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char1~output_o\);

\seg7_char2~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char2~output_o\);

\sw[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(0),
	o => \sw[0]~input_o\);

\sw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

\sw[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(2),
	o => \sw[2]~input_o\);

\sw[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(3),
	o => \sw[3]~input_o\);

\INST1|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST1|Mux5~0_combout\ = (\sw[1]~input_o\ & ((\sw[0]~input_o\ & ((\sw[3]~input_o\))) # (!\sw[0]~input_o\ & (\sw[2]~input_o\)))) # (!\sw[1]~input_o\ & (\sw[2]~input_o\ & (\sw[0]~input_o\ $ (\sw[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \sw[1]~input_o\,
	datac => \sw[2]~input_o\,
	datad => \sw[3]~input_o\,
	combout => \INST1|Mux5~0_combout\);

\sw[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(4),
	o => \sw[4]~input_o\);

\sw[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(5),
	o => \sw[5]~input_o\);

\sw[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(6),
	o => \sw[6]~input_o\);

\sw[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(7),
	o => \sw[7]~input_o\);

\INST2|Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|Mux5~0_combout\ = (\sw[5]~input_o\ & ((\sw[4]~input_o\ & ((\sw[7]~input_o\))) # (!\sw[4]~input_o\ & (\sw[6]~input_o\)))) # (!\sw[5]~input_o\ & (\sw[6]~input_o\ & (\sw[4]~input_o\ $ (\sw[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \sw[5]~input_o\,
	datac => \sw[6]~input_o\,
	datad => \sw[7]~input_o\,
	combout => \INST2|Mux5~0_combout\);

\clkin_50~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clkin_50,
	o => \clkin_50~input_o\);

\INST3|clk_proc:COUNT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[0]~0_combout\ = !\INST3|clk_proc:COUNT[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[0]~q\,
	combout => \INST3|clk_proc:COUNT[0]~0_combout\);

\INST3|clk_proc:COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[0]~q\);

\INST3|clk_proc:COUNT[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[1]~1_combout\ = (\INST3|clk_proc:COUNT[1]~q\ & (\INST3|clk_proc:COUNT[0]~q\ $ (VCC))) # (!\INST3|clk_proc:COUNT[1]~q\ & (\INST3|clk_proc:COUNT[0]~q\ & VCC))
-- \INST3|clk_proc:COUNT[1]~2\ = CARRY((\INST3|clk_proc:COUNT[1]~q\ & \INST3|clk_proc:COUNT[0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[1]~q\,
	datab => \INST3|clk_proc:COUNT[0]~q\,
	datad => VCC,
	combout => \INST3|clk_proc:COUNT[1]~1_combout\,
	cout => \INST3|clk_proc:COUNT[1]~2\);

\INST3|clk_proc:COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[1]~q\);

\INST3|clk_proc:COUNT[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[2]~1_combout\ = (\INST3|clk_proc:COUNT[2]~q\ & (!\INST3|clk_proc:COUNT[1]~2\)) # (!\INST3|clk_proc:COUNT[2]~q\ & ((\INST3|clk_proc:COUNT[1]~2\) # (GND)))
-- \INST3|clk_proc:COUNT[2]~2\ = CARRY((!\INST3|clk_proc:COUNT[1]~2\) # (!\INST3|clk_proc:COUNT[2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[2]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[1]~2\,
	combout => \INST3|clk_proc:COUNT[2]~1_combout\,
	cout => \INST3|clk_proc:COUNT[2]~2\);

\INST3|clk_proc:COUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[2]~q\);

\INST3|clk_proc:COUNT[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[3]~1_combout\ = (\INST3|clk_proc:COUNT[3]~q\ & (\INST3|clk_proc:COUNT[2]~2\ $ (GND))) # (!\INST3|clk_proc:COUNT[3]~q\ & (!\INST3|clk_proc:COUNT[2]~2\ & VCC))
-- \INST3|clk_proc:COUNT[3]~2\ = CARRY((\INST3|clk_proc:COUNT[3]~q\ & !\INST3|clk_proc:COUNT[2]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[3]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[2]~2\,
	combout => \INST3|clk_proc:COUNT[3]~1_combout\,
	cout => \INST3|clk_proc:COUNT[3]~2\);

\INST3|clk_proc:COUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[3]~q\);

\INST3|clk_proc:COUNT[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[4]~1_combout\ = (\INST3|clk_proc:COUNT[4]~q\ & (!\INST3|clk_proc:COUNT[3]~2\)) # (!\INST3|clk_proc:COUNT[4]~q\ & ((\INST3|clk_proc:COUNT[3]~2\) # (GND)))
-- \INST3|clk_proc:COUNT[4]~2\ = CARRY((!\INST3|clk_proc:COUNT[3]~2\) # (!\INST3|clk_proc:COUNT[4]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[4]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[3]~2\,
	combout => \INST3|clk_proc:COUNT[4]~1_combout\,
	cout => \INST3|clk_proc:COUNT[4]~2\);

\INST3|clk_proc:COUNT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[4]~q\);

\INST3|clk_proc:COUNT[5]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[5]~1_combout\ = (\INST3|clk_proc:COUNT[5]~q\ & (\INST3|clk_proc:COUNT[4]~2\ $ (GND))) # (!\INST3|clk_proc:COUNT[5]~q\ & (!\INST3|clk_proc:COUNT[4]~2\ & VCC))
-- \INST3|clk_proc:COUNT[5]~2\ = CARRY((\INST3|clk_proc:COUNT[5]~q\ & !\INST3|clk_proc:COUNT[4]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[5]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[4]~2\,
	combout => \INST3|clk_proc:COUNT[5]~1_combout\,
	cout => \INST3|clk_proc:COUNT[5]~2\);

\INST3|clk_proc:COUNT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[5]~q\);

\INST3|clk_proc:COUNT[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[6]~1_combout\ = (\INST3|clk_proc:COUNT[6]~q\ & (!\INST3|clk_proc:COUNT[5]~2\)) # (!\INST3|clk_proc:COUNT[6]~q\ & ((\INST3|clk_proc:COUNT[5]~2\) # (GND)))
-- \INST3|clk_proc:COUNT[6]~2\ = CARRY((!\INST3|clk_proc:COUNT[5]~2\) # (!\INST3|clk_proc:COUNT[6]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[6]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[5]~2\,
	combout => \INST3|clk_proc:COUNT[6]~1_combout\,
	cout => \INST3|clk_proc:COUNT[6]~2\);

\INST3|clk_proc:COUNT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[6]~q\);

\INST3|clk_proc:COUNT[7]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[7]~1_combout\ = (\INST3|clk_proc:COUNT[7]~q\ & (\INST3|clk_proc:COUNT[6]~2\ $ (GND))) # (!\INST3|clk_proc:COUNT[7]~q\ & (!\INST3|clk_proc:COUNT[6]~2\ & VCC))
-- \INST3|clk_proc:COUNT[7]~2\ = CARRY((\INST3|clk_proc:COUNT[7]~q\ & !\INST3|clk_proc:COUNT[6]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[7]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[6]~2\,
	combout => \INST3|clk_proc:COUNT[7]~1_combout\,
	cout => \INST3|clk_proc:COUNT[7]~2\);

\INST3|clk_proc:COUNT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[7]~q\);

\INST3|clk_proc:COUNT[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[8]~1_combout\ = (\INST3|clk_proc:COUNT[8]~q\ & (!\INST3|clk_proc:COUNT[7]~2\)) # (!\INST3|clk_proc:COUNT[8]~q\ & ((\INST3|clk_proc:COUNT[7]~2\) # (GND)))
-- \INST3|clk_proc:COUNT[8]~2\ = CARRY((!\INST3|clk_proc:COUNT[7]~2\) # (!\INST3|clk_proc:COUNT[8]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[8]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[7]~2\,
	combout => \INST3|clk_proc:COUNT[8]~1_combout\,
	cout => \INST3|clk_proc:COUNT[8]~2\);

\INST3|clk_proc:COUNT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[8]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[8]~q\);

\INST3|clk_proc:COUNT[9]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[9]~1_combout\ = (\INST3|clk_proc:COUNT[9]~q\ & (\INST3|clk_proc:COUNT[8]~2\ $ (GND))) # (!\INST3|clk_proc:COUNT[9]~q\ & (!\INST3|clk_proc:COUNT[8]~2\ & VCC))
-- \INST3|clk_proc:COUNT[9]~2\ = CARRY((\INST3|clk_proc:COUNT[9]~q\ & !\INST3|clk_proc:COUNT[8]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[9]~q\,
	datad => VCC,
	cin => \INST3|clk_proc:COUNT[8]~2\,
	combout => \INST3|clk_proc:COUNT[9]~1_combout\,
	cout => \INST3|clk_proc:COUNT[9]~2\);

\INST3|clk_proc:COUNT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[9]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[9]~q\);

\INST3|clk_proc:COUNT[10]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_proc:COUNT[10]~1_combout\ = \INST3|clk_proc:COUNT[10]~q\ $ (\INST3|clk_proc:COUNT[9]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_proc:COUNT[10]~q\,
	cin => \INST3|clk_proc:COUNT[9]~2\,
	combout => \INST3|clk_proc:COUNT[10]~1_combout\);

\INST3|clk_proc:COUNT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_proc:COUNT[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_proc:COUNT[10]~q\);

\INST3|DOUT_TEMP[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|DOUT_TEMP[1]~0_combout\ = (\INST3|clk_proc:COUNT[10]~q\ & (!\INST1|Mux5~0_combout\)) # (!\INST3|clk_proc:COUNT[10]~q\ & ((!\INST2|Mux5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST1|Mux5~0_combout\,
	datab => \INST2|Mux5~0_combout\,
	datad => \INST3|clk_proc:COUNT[10]~q\,
	combout => \INST3|DOUT_TEMP[1]~0_combout\);

\INST1|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST1|Mux1~0_combout\ = (\sw[1]~input_o\ & (!\sw[3]~input_o\ & ((\sw[0]~input_o\) # (!\sw[2]~input_o\)))) # (!\sw[1]~input_o\ & ((\sw[2]~input_o\ & ((\sw[3]~input_o\))) # (!\sw[2]~input_o\ & (\sw[0]~input_o\ & !\sw[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \sw[1]~input_o\,
	datac => \sw[2]~input_o\,
	datad => \sw[3]~input_o\,
	combout => \INST1|Mux1~0_combout\);

\INST2|Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|Mux1~0_combout\ = (\sw[5]~input_o\ & (!\sw[7]~input_o\ & ((\sw[4]~input_o\) # (!\sw[6]~input_o\)))) # (!\sw[5]~input_o\ & ((\sw[6]~input_o\ & ((\sw[7]~input_o\))) # (!\sw[6]~input_o\ & (\sw[4]~input_o\ & !\sw[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \sw[5]~input_o\,
	datac => \sw[6]~input_o\,
	datad => \sw[7]~input_o\,
	combout => \INST2|Mux1~0_combout\);

\INST3|DOUT_TEMP[5]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|DOUT_TEMP[5]~1_combout\ = (\INST3|clk_proc:COUNT[10]~q\ & (!\INST1|Mux1~0_combout\)) # (!\INST3|clk_proc:COUNT[10]~q\ & ((!\INST2|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST1|Mux1~0_combout\,
	datab => \INST2|Mux1~0_combout\,
	datad => \INST3|clk_proc:COUNT[10]~q\,
	combout => \INST3|DOUT_TEMP[5]~1_combout\);

\INST1|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST1|Mux0~0_combout\ = (\sw[3]~input_o\) # ((\sw[1]~input_o\ & ((!\sw[2]~input_o\) # (!\sw[0]~input_o\))) # (!\sw[1]~input_o\ & ((\sw[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \sw[1]~input_o\,
	datac => \sw[2]~input_o\,
	datad => \sw[3]~input_o\,
	combout => \INST1|Mux0~0_combout\);

\INST2|Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|Mux0~0_combout\ = (\sw[7]~input_o\) # ((\sw[5]~input_o\ & ((!\sw[6]~input_o\) # (!\sw[4]~input_o\))) # (!\sw[5]~input_o\ & ((\sw[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \sw[5]~input_o\,
	datac => \sw[6]~input_o\,
	datad => \sw[7]~input_o\,
	combout => \INST2|Mux0~0_combout\);

\INST3|DOUT_TEMP[6]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|DOUT_TEMP[6]~2_combout\ = (\INST3|clk_proc:COUNT[10]~q\ & (\INST1|Mux0~0_combout\)) # (!\INST3|clk_proc:COUNT[10]~q\ & ((\INST2|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST1|Mux0~0_combout\,
	datab => \INST2|Mux0~0_combout\,
	datad => \INST3|clk_proc:COUNT[10]~q\,
	combout => \INST3|DOUT_TEMP[6]~2_combout\);

\INST6|ud_bin_counter[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[0]~8_combout\ = \INST6|ud_bin_counter\(0) $ (VCC)
-- \INST6|ud_bin_counter[0]~9\ = CARRY(\INST6|ud_bin_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(0),
	datad => VCC,
	combout => \INST6|ud_bin_counter[0]~8_combout\,
	cout => \INST6|ud_bin_counter[0]~9\);

\pb_n[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(0),
	o => \pb_n[0]~input_o\);

\INST6|ud_bin_counter[0]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[0]~10_combout\ = (\sw[0]~input_o\) # (!\pb_n[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datad => \pb_n[0]~input_o\,
	combout => \INST6|ud_bin_counter[0]~10_combout\);

\INST6|ud_bin_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[0]~8_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(0));

\INST6|ud_bin_counter[1]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[1]~11_combout\ = (\INST6|ud_bin_counter\(1) & ((\sw[1]~input_o\ & (!\INST6|ud_bin_counter[0]~9\)) # (!\sw[1]~input_o\ & (\INST6|ud_bin_counter[0]~9\ & VCC)))) # (!\INST6|ud_bin_counter\(1) & ((\sw[1]~input_o\ & 
-- ((\INST6|ud_bin_counter[0]~9\) # (GND))) # (!\sw[1]~input_o\ & (!\INST6|ud_bin_counter[0]~9\))))
-- \INST6|ud_bin_counter[1]~12\ = CARRY((\INST6|ud_bin_counter\(1) & (\sw[1]~input_o\ & !\INST6|ud_bin_counter[0]~9\)) # (!\INST6|ud_bin_counter\(1) & ((\sw[1]~input_o\) # (!\INST6|ud_bin_counter[0]~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(1),
	datab => \sw[1]~input_o\,
	datad => VCC,
	cin => \INST6|ud_bin_counter[0]~9\,
	combout => \INST6|ud_bin_counter[1]~11_combout\,
	cout => \INST6|ud_bin_counter[1]~12\);

\INST6|ud_bin_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[1]~11_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(1));

\INST6|ud_bin_counter[2]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[2]~13_combout\ = ((\INST6|ud_bin_counter\(2) $ (\sw[1]~input_o\ $ (\INST6|ud_bin_counter[1]~12\)))) # (GND)
-- \INST6|ud_bin_counter[2]~14\ = CARRY((\INST6|ud_bin_counter\(2) & ((!\INST6|ud_bin_counter[1]~12\) # (!\sw[1]~input_o\))) # (!\INST6|ud_bin_counter\(2) & (!\sw[1]~input_o\ & !\INST6|ud_bin_counter[1]~12\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(2),
	datab => \sw[1]~input_o\,
	datad => VCC,
	cin => \INST6|ud_bin_counter[1]~12\,
	combout => \INST6|ud_bin_counter[2]~13_combout\,
	cout => \INST6|ud_bin_counter[2]~14\);

\INST6|ud_bin_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[2]~13_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(2));

\INST6|ud_bin_counter[3]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[3]~15_combout\ = (\INST6|ud_bin_counter\(3) & ((\sw[1]~input_o\ & (!\INST6|ud_bin_counter[2]~14\)) # (!\sw[1]~input_o\ & (\INST6|ud_bin_counter[2]~14\ & VCC)))) # (!\INST6|ud_bin_counter\(3) & ((\sw[1]~input_o\ & 
-- ((\INST6|ud_bin_counter[2]~14\) # (GND))) # (!\sw[1]~input_o\ & (!\INST6|ud_bin_counter[2]~14\))))
-- \INST6|ud_bin_counter[3]~16\ = CARRY((\INST6|ud_bin_counter\(3) & (\sw[1]~input_o\ & !\INST6|ud_bin_counter[2]~14\)) # (!\INST6|ud_bin_counter\(3) & ((\sw[1]~input_o\) # (!\INST6|ud_bin_counter[2]~14\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(3),
	datab => \sw[1]~input_o\,
	datad => VCC,
	cin => \INST6|ud_bin_counter[2]~14\,
	combout => \INST6|ud_bin_counter[3]~15_combout\,
	cout => \INST6|ud_bin_counter[3]~16\);

\INST6|ud_bin_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[3]~15_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(3));

\INST6|ud_bin_counter[4]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[4]~17_combout\ = ((\INST6|ud_bin_counter\(4) $ (\sw[1]~input_o\ $ (\INST6|ud_bin_counter[3]~16\)))) # (GND)
-- \INST6|ud_bin_counter[4]~18\ = CARRY((\INST6|ud_bin_counter\(4) & ((!\INST6|ud_bin_counter[3]~16\) # (!\sw[1]~input_o\))) # (!\INST6|ud_bin_counter\(4) & (!\sw[1]~input_o\ & !\INST6|ud_bin_counter[3]~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(4),
	datab => \sw[1]~input_o\,
	datad => VCC,
	cin => \INST6|ud_bin_counter[3]~16\,
	combout => \INST6|ud_bin_counter[4]~17_combout\,
	cout => \INST6|ud_bin_counter[4]~18\);

\INST6|ud_bin_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[4]~17_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(4));

\INST6|ud_bin_counter[5]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[5]~19_combout\ = (\INST6|ud_bin_counter\(5) & ((\sw[1]~input_o\ & (!\INST6|ud_bin_counter[4]~18\)) # (!\sw[1]~input_o\ & (\INST6|ud_bin_counter[4]~18\ & VCC)))) # (!\INST6|ud_bin_counter\(5) & ((\sw[1]~input_o\ & 
-- ((\INST6|ud_bin_counter[4]~18\) # (GND))) # (!\sw[1]~input_o\ & (!\INST6|ud_bin_counter[4]~18\))))
-- \INST6|ud_bin_counter[5]~20\ = CARRY((\INST6|ud_bin_counter\(5) & (\sw[1]~input_o\ & !\INST6|ud_bin_counter[4]~18\)) # (!\INST6|ud_bin_counter\(5) & ((\sw[1]~input_o\) # (!\INST6|ud_bin_counter[4]~18\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(5),
	datab => \sw[1]~input_o\,
	datad => VCC,
	cin => \INST6|ud_bin_counter[4]~18\,
	combout => \INST6|ud_bin_counter[5]~19_combout\,
	cout => \INST6|ud_bin_counter[5]~20\);

\INST6|ud_bin_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[5]~19_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(5));

\INST6|ud_bin_counter[6]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[6]~21_combout\ = ((\INST6|ud_bin_counter\(6) $ (\sw[1]~input_o\ $ (\INST6|ud_bin_counter[5]~20\)))) # (GND)
-- \INST6|ud_bin_counter[6]~22\ = CARRY((\INST6|ud_bin_counter\(6) & ((!\INST6|ud_bin_counter[5]~20\) # (!\sw[1]~input_o\))) # (!\INST6|ud_bin_counter\(6) & (!\sw[1]~input_o\ & !\INST6|ud_bin_counter[5]~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(6),
	datab => \sw[1]~input_o\,
	datad => VCC,
	cin => \INST6|ud_bin_counter[5]~20\,
	combout => \INST6|ud_bin_counter[6]~21_combout\,
	cout => \INST6|ud_bin_counter[6]~22\);

\INST6|ud_bin_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[6]~21_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(6));

\INST6|ud_bin_counter[7]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|ud_bin_counter[7]~23_combout\ = \INST6|ud_bin_counter\(7) $ (\sw[1]~input_o\ $ (!\INST6|ud_bin_counter[6]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|ud_bin_counter\(7),
	datab => \sw[1]~input_o\,
	cin => \INST6|ud_bin_counter[6]~22\,
	combout => \INST6|ud_bin_counter[7]~23_combout\);

\INST6|ud_bin_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|ud_bin_counter[7]~23_combout\,
	sclr => \ALT_INV_pb_n[0]~input_o\,
	ena => \INST6|ud_bin_counter[0]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|ud_bin_counter\(7));

\INST1|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST1|Mux6~0_combout\ = (\sw[1]~input_o\ & (\sw[0]~input_o\ & (!\sw[2]~input_o\ & \sw[3]~input_o\))) # (!\sw[1]~input_o\ & (\sw[2]~input_o\ $ (((\sw[0]~input_o\ & !\sw[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \sw[1]~input_o\,
	datac => \sw[2]~input_o\,
	datad => \sw[3]~input_o\,
	combout => \INST1|Mux6~0_combout\);

\INST2|Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|Mux6~0_combout\ = (\sw[5]~input_o\ & (\sw[4]~input_o\ & (!\sw[6]~input_o\ & \sw[7]~input_o\))) # (!\sw[5]~input_o\ & (\sw[6]~input_o\ $ (((\sw[4]~input_o\ & !\sw[7]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \sw[5]~input_o\,
	datac => \sw[6]~input_o\,
	datad => \sw[7]~input_o\,
	combout => \INST2|Mux6~0_combout\);

\INST3|DOUT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|DOUT[0]~0_combout\ = (\INST3|clk_proc:COUNT[10]~q\ & (\INST1|Mux6~0_combout\)) # (!\INST3|clk_proc:COUNT[10]~q\ & ((\INST2|Mux6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST1|Mux6~0_combout\,
	datab => \INST2|Mux6~0_combout\,
	datad => \INST3|clk_proc:COUNT[10]~q\,
	combout => \INST3|DOUT[0]~0_combout\);

\INST1|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST1|Mux4~0_combout\ = (\sw[2]~input_o\ & (\sw[3]~input_o\ & ((\sw[1]~input_o\) # (!\sw[0]~input_o\)))) # (!\sw[2]~input_o\ & (!\sw[0]~input_o\ & (\sw[1]~input_o\ & !\sw[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \sw[1]~input_o\,
	datac => \sw[2]~input_o\,
	datad => \sw[3]~input_o\,
	combout => \INST1|Mux4~0_combout\);

\INST2|Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|Mux4~0_combout\ = (\sw[6]~input_o\ & (\sw[7]~input_o\ & ((\sw[5]~input_o\) # (!\sw[4]~input_o\)))) # (!\sw[6]~input_o\ & (!\sw[4]~input_o\ & (\sw[5]~input_o\ & !\sw[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \sw[5]~input_o\,
	datac => \sw[6]~input_o\,
	datad => \sw[7]~input_o\,
	combout => \INST2|Mux4~0_combout\);

\INST3|DOUT[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|DOUT[2]~2_combout\ = (\INST3|clk_proc:COUNT[10]~q\ & (\INST1|Mux4~0_combout\)) # (!\INST3|clk_proc:COUNT[10]~q\ & ((\INST2|Mux4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST1|Mux4~0_combout\,
	datab => \INST2|Mux4~0_combout\,
	datad => \INST3|clk_proc:COUNT[10]~q\,
	combout => \INST3|DOUT[2]~2_combout\);

\INST1|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST1|Mux3~0_combout\ = (\sw[1]~input_o\ & ((\sw[0]~input_o\ & (\sw[2]~input_o\)) # (!\sw[0]~input_o\ & (!\sw[2]~input_o\ & \sw[3]~input_o\)))) # (!\sw[1]~input_o\ & (!\sw[3]~input_o\ & (\sw[0]~input_o\ $ (\sw[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \sw[1]~input_o\,
	datac => \sw[2]~input_o\,
	datad => \sw[3]~input_o\,
	combout => \INST1|Mux3~0_combout\);

\INST2|Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|Mux3~0_combout\ = (\sw[5]~input_o\ & ((\sw[4]~input_o\ & (\sw[6]~input_o\)) # (!\sw[4]~input_o\ & (!\sw[6]~input_o\ & \sw[7]~input_o\)))) # (!\sw[5]~input_o\ & (!\sw[7]~input_o\ & (\sw[4]~input_o\ $ (\sw[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \sw[5]~input_o\,
	datac => \sw[6]~input_o\,
	datad => \sw[7]~input_o\,
	combout => \INST2|Mux3~0_combout\);

\INST3|DOUT[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|DOUT[3]~3_combout\ = (\INST3|clk_proc:COUNT[10]~q\ & (\INST1|Mux3~0_combout\)) # (!\INST3|clk_proc:COUNT[10]~q\ & ((\INST2|Mux3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST1|Mux3~0_combout\,
	datab => \INST2|Mux3~0_combout\,
	datad => \INST3|clk_proc:COUNT[10]~q\,
	combout => \INST3|DOUT[3]~3_combout\);

\INST1|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST1|Mux2~0_combout\ = (\sw[1]~input_o\ & (\sw[0]~input_o\ & ((!\sw[3]~input_o\)))) # (!\sw[1]~input_o\ & ((\sw[2]~input_o\ & ((!\sw[3]~input_o\))) # (!\sw[2]~input_o\ & (\sw[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datab => \sw[1]~input_o\,
	datac => \sw[2]~input_o\,
	datad => \sw[3]~input_o\,
	combout => \INST1|Mux2~0_combout\);

\INST2|Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|Mux2~0_combout\ = (\sw[5]~input_o\ & (\sw[4]~input_o\ & ((!\sw[7]~input_o\)))) # (!\sw[5]~input_o\ & ((\sw[6]~input_o\ & ((!\sw[7]~input_o\))) # (!\sw[6]~input_o\ & (\sw[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[4]~input_o\,
	datab => \sw[5]~input_o\,
	datac => \sw[6]~input_o\,
	datad => \sw[7]~input_o\,
	combout => \INST2|Mux2~0_combout\);

\INST3|DOUT[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|DOUT[4]~4_combout\ = (\INST3|clk_proc:COUNT[10]~q\ & (\INST1|Mux2~0_combout\)) # (!\INST3|clk_proc:COUNT[10]~q\ & ((\INST2|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST1|Mux2~0_combout\,
	datab => \INST2|Mux2~0_combout\,
	datad => \INST3|clk_proc:COUNT[10]~q\,
	combout => \INST3|DOUT[4]~4_combout\);

\pb_n[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(1),
	o => \pb_n[1]~input_o\);

\pb_n[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(2),
	o => \pb_n[2]~input_o\);

\pb_n[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(3),
	o => \pb_n[3]~input_o\);

ww_leds(0) <= \leds[0]~output_o\;

ww_leds(1) <= \leds[1]~output_o\;

ww_leds(2) <= \leds[2]~output_o\;

ww_leds(3) <= \leds[3]~output_o\;

ww_leds(4) <= \leds[4]~output_o\;

ww_leds(5) <= \leds[5]~output_o\;

ww_leds(6) <= \leds[6]~output_o\;

ww_leds(7) <= \leds[7]~output_o\;

ww_seg7_data(0) <= \seg7_data[0]~output_o\;

ww_seg7_data(1) <= \seg7_data[1]~output_o\;

ww_seg7_data(2) <= \seg7_data[2]~output_o\;

ww_seg7_data(3) <= \seg7_data[3]~output_o\;

ww_seg7_data(4) <= \seg7_data[4]~output_o\;

ww_seg7_data(5) <= \seg7_data[5]~output_o\;

ww_seg7_data(6) <= \seg7_data[6]~output_o\;

ww_seg7_char1 <= \seg7_char1~output_o\;

ww_seg7_char2 <= \seg7_char2~output_o\;
END structure;


