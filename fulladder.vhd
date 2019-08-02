----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:24:26 05/29/2018 
-- Design Name: 
-- Module Name:    fulladder - Behavioral 
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

entity fulladder is
port(
	A : in STD_LOGIC;
	B : in STD_LOGIC;
	C : in STD_LOGIC;
	sum : out STD_LOGIC;
	carry : out STD_LOGIC
);

end fulladder;

architecture Behavioral of fulladder is
begin
process(A,B,C)
begin

sum <= (A XOR B XOR C);
carry <= (A AND B) OR (A AND C) OR (B AND C);

end process;


end Behavioral;

