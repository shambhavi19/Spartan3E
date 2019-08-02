----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:23:50 05/31/2018 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

entity register_r is
port(
Din : in std_logic_vector(3 downto 0);
Dout : out std_logic_vector(3 downto 0);
RW : in std_logic
);
end register_r;

architecture Behavioral of register_r is
signal temp : std_logic_vector(3 downto 0) := "0000";
begin
process(Din, RW)
begin

if(RW = '1') then 
	temp <= Din;
	
elsif (RW = '0') then
	Dout <= temp;

end if;
end process;
	
end Behavioral;

