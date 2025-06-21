library ieee;
use ieee.std_logic_1164.all;


entity Tester is port (
 	MC_TESTMODE				: in  std_logic;
   I1EQI2,I1GTI2,I1LTI2	: in	std_logic;
	input1					: in  std_logic_vector(3 downto 0);
	input2					: in  std_logic_vector(3 downto 0);
	TEST_PASS  				: out	std_logic							 
	); 
end Tester;

architecture Test_ckt of Tester is

signal EQ_PASS, GT_PASS, LT_PASS : std_logic;

begin

Tester1: 
PROCESS (MC_TESTMODE, input1, input2, I1EQI2, I1GTI2, I1LTI2) is
 
begin
		
		IF ((input1 = input2) AND (I1EQI2 = '1')) THEN 
		EQ_PASS <= '1';
		GT_PASS <= '0'; 
		LT_PASS <= '0';
		
		ELSIF ((input1 > input2) AND (I1GTI2 = '1')) THEN  
		GT_PASS <= '1';
		EQ_PASS <= '0'; 
		LT_PASS <= '0';
		
		ELSIF ((input1 < input2) AND (I1LTI2 = '1')) THEN  
		LT_PASS <= '1';
		EQ_PASS <= '0'; 
		GT_PASS <= '0'; 
		
		ELSE  
		
		EQ_PASS <= '0'; 
		GT_PASS <= '0'; 
		LT_PASS <= '0';
		
		END IF;
		TEST_PASS <= MC_TESTMODE AND (EQ_PASS OR GT_PASS OR LT_PASS);
		
end process;

end;