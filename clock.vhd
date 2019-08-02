----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:51:39 06/01/2018 
-- Design Name: 
-- Module Name:    clock - Behavioral 
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

entity clock is
port(
	clk_in : in std_logic;
	reset : in std_logic;
	clk_out : out std_logic
);
end clock;

architecture Behavioral of clock is

signal temp : std_logic := '0';
signal count : integer := 0;
signal prescaler : integer := 50000000; --defauult frequency = 2Hz  

begin
process(clk_in, reset)
begin

if(reset = '0') then
	if(rising_edge(clk_in)) then
		count <= count + 1;
		if (count = prescaler) then
			temp <= not temp;	
			count <= 0;
		end if;
	end if;
else count <= 0;
end if;

end process;

clk_out <= temp;

end Behavioral;

