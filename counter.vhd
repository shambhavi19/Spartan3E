----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:34 05/30/2018 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
port(
enable : in std_logic;
counter : out std_logic_vector(3 downto 0);
clk_in : in std_logic;
reset : in std_logic;
clk_out : inout std_logic);
end counter;

architecture Behavioral of counter is

signal output :  std_logic_vector(3 downto 0):="0000";
signal temp : std_logic := '0';
signal count : integer := 0;
signal prescaler : integer := 50000000; --defauult frequency = 2Hz  

begin
clock : process(clk_in, reset)
begin

if(reset = '1') then
	count <= 0;
	
elsif(rising_edge(clk_in)) then
		count <= count + 1;
		if (count = prescaler) then
			temp <= not temp;	
			count <= 0;
		end if;
	end if;

end process;

clk_out <= temp;

cnt : process(reset, enable, clk_out)
begin

if (reset = '1')  then
	output <= "0000";

elsif(rising_edge(clk_out)) then
		if(enable = '0') then
			output <= output + '1';
		else output <= output - '1';		
		end if;


end if;

end process;
counter <= output;

end Behavioral;

