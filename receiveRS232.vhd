----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:41:02 06/11/2018 
-- Design Name: 
-- Module Name:    receive - Behavioral 
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

entity receive is
PORT(
clk50 : in std_logic;
LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
RX0 : INOUT STD_LOGIC
);
end receive;

architecture Behavioral of receive is

SIGNAL RXFLAG : STD_LOGIC := '1';
SIGNAL DATA8 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
SIGNAL COUNT : INTEGER := 0;
SIGNAL i : INTEGER := 0;
SIGNAL TEMP : STD_LOGIC := '0';

begin
PROCESS(CLK50)
BEGIN

IF(RISING_EDGE(CLK50)) THEN 
	IF(RX0 = '0' AND RXFLAG = '0' AND TEMP = '0') THEN 
		RXFLAG <= '1';
		TEMP <= '1';
	ELSE RXFLAG <= '0';
	END IF;
	
	if(COUNT < 5208) then
		COUNT <= COUNT + 1;
		END if;
	
	IF (RXFLAG = '1' AND COUNT = 5208 AND i < 8) THEN
		DATA8(i) <= RX0;
		i <= i + 1;
	END IF;
	
	IF(i = 8 AND TEMP = '1' AND COUNT = 5208) THEN
		RXFLAG <= '0';
		TEMP <= '0';
		END if;
		
END IF;
		
END PROCESS;
LED <= DATA8;
end Behavioral;

