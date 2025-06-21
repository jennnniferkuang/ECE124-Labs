LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY Bidir_shift_reg IS PORT(
	 CLK				:IN std_logic := '0';
	 RESET			:IN std_logic := '0';
	 CLK_EN			:IN std_logic := '0';
	 LEFTTO_RIGHT1			:IN std_logic := '0';
	 REG_BITS			:OUT std_logic_vector(7 downto 0)
	 );
END ENTITY;

ARCHITECTURE one OF Bidir_shift_reg IS
SIGNAL sreg			:std_logic_vector( 7 downto 0);

BEGIN

PROCESS (CLK) IS 

BEGIN 
	IF(rising_edge(CLK)) THEN
		IF (RESET = '1') THEN
			sreg <= "00000000";
			
		ELSIF (CLK_EN = '1') THEN 
			IF (LEFTTO_RIGHT1 = '1') THEN
			
				sreg(7 downto 0) <= '1' & sreg(7 downto 1); -- right-shifts of bits
			ELSE
				sreg(7 downto 0) <= sreg (6 downto 0) & '0'; --left shifts of bits
			END IF;
		END IF;
	END IF;
	
	REG_BITS <= sreg;
END PROCESS;
END one;