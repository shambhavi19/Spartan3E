----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:49 05/31/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.numeric_std.ALL;
--use IEEE.STD_LOGIC_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
port(
mode : in std_logic; --_vector(1 downto 0);
a : in std_logic_vector(2 downto 0); --input 1
b : in std_logic_vector(2 downto 0); --input 2
--sign : out std_logic;
carry : out std_logic ;
output : out std_logic_vector(1 downto 0)
); 
end ALU;

architecture Behavioral of ALU is

signal temp : std_logic_vector(1 downto 0) := "00" ;
signal flag : std_logic := '0';
signal o : std_logic_vector(2 downto 0) := "000";
signal a1 : std_logic_vector(2 downto 0);
signal b1 : std_logic_vector(2 downto 0);
 
begin
process(a,b,mode)
begin

if (mode = '0') then 
	o <= a + b;
	
elsif(mode = '1') then 
	o <= a - b;
	
else o <= "000";
end if;
	
end process;
	
output <= o(1 downto 0);
carry <= o(2);

end Behavioral;

