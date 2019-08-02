----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:35:50 05/31/2018 
-- Design Name: 
-- Module Name:    FourBit - Behavioral 
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

entity FourBit is
port(
ip : in std_logic_vector(3 downto 0);
op : out std_logic_vector(3 downto 0);
enable : in std_logic
);
end FourBit;

architecture Behavioral of FourBit is

COMPONENT register_r
	PORT(
		Din : IN std_logic_vector(3 downto 0);
		RW : IN std_logic;          
		Dout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	

begin

reg_1: entity work.register_r PORT MAP(
		Din => ip,
		Dout => op,
		RW => enable
		);

end Behavioral;

