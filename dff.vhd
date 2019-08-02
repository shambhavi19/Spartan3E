----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:05:51 05/30/2018 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

entity dff is
port(
CLK : in STD_LOGIC;
D : in STD_LOGIC;
Q,QNOT : out STD_LOGIC);
end dff;

architecture Behavioral of dff is

begin
process(D, CLK)
begin
if (CLK = '1') then
	Q <= D ;
	QNOT <= not D;
else Q <= '0';
		QNOT <= '0';

end if;
end process;

end Behavioral;

