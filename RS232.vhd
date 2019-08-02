----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:17:17 06/08/2018 
-- Design Name: 
-- Module Name:    RS232 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RS232 is
PORT(
CLK50 : IN STD_LOGIC;
RESET : IN STD_LOGIC;
TX0 : OUT STD_LOGIC
);

end RS232;

architecture Behavioral of RS232 is

SIGNAL DATA8 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01100001";
SIGNAL DATA10: STD_LOGIC_VECTOR(9 DOWNTO 0) := "1000000000";  	
SIGNAL TXFLAG : STD_LOGIC := '0';
SIGNAL COUNT : INTEGER := 0;
SIGNAL i : INTEGER := 1;
signal  temp : std_logic := '0';
signal  start : std_logic := '0';

begin
PROCESS(CLK50, RESET)
BEGIN

IF(RESET = '1') THEN
	NULL;
	
ELSIF(RISING_EDGE(CLK50)) THEN
	IF(TXFLAG = '0' and temp = '0') THEN
		DATA10(8 DOWNTO 1) <= DATA8(7 DOWNTO 0);
		TXFLAG <= '1';
		temp <= '1';
	END IF;	
	
IF(TXFLAG = '1') THEN

	if(COUNT < 5208 ) then
		COUNT <= COUNT + 1;
		END if;

	if(temp = '1' and start = '0' and count = 5208) then
		TX0 <= DATA10(0);
		TEMP <= '0';
		start <= '1';
		count <= 0;
	end if;
		
		if(count = 5208 and i < 10 and start = '1') then
		TX0 <= DATA10(i);
		i <= i + 1;
		COUNT <= 0;
		elsif (i = 10  and count = 5208) then
			
			i <= 1;
			temp <= '1';
			count <= 0;
			start <= '0';
			NULL;
		
		END if ;
	
END IF;
END IF;
END PROCESS;
END Behavioral;

