----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:53 05/29/2018 
-- Design Name: 
-- Module Name:    demux - Behavioral 
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

entity demux is
port(
I : in std_logic;
O : out std_logic_vector(3 downto 0);
S : in std_logic_vector(1 downto 0)
);

end demux;

architecture Behavioral of demux is

begin
process(I,S)
begin
	O <= "0000";
case S is
	when "00" => O(0) <= I;
	when "01" => O(1) <= I;
	when "10" => O(2) <= I;
	when "11" => O(3) <= I;
	when others => O <= "0000";
	
end case;
end process;


end Behavioral;

