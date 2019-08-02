----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:10:49 06/06/2018 
-- Design Name: 
-- Module Name:    VGA - Behavioral 
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

entity VGA is
PORT (
VGA_R : OUT STD_LOGIC;
VGA_G : OUT STD_LOGIC;
VGA_B : OUT STD_LOGIC;
HS : OUT STD_LOGIC;
VS : OUT STD_LOGIC;
clk50 : in std_logic

);

end VGA;

architecture Behavioral of VGA is

SIGNAL READY : STD_LOGIC;
SIGNAL HCOUNT : INTEGER RANGE 0 TO 2200 := 0;
SIGNAL VCOUNT : INTEGER RANGE 0 TO 1125 := 0;
SIGNAL clk25 : std_logic;

COMPONENT CLOCK25
	PORT(
		CLKIN_IN : IN std_logic;          
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;

begin

Inst_CLOCK25: CLOCK25 PORT MAP(
		CLKIN_IN => CLK50,
		CLKFX_OUT => CLK25,
		CLKIN_IBUFG_OUT => OPEN,
		CLK0_OUT => OPEN,
		LOCKED_OUT => READY
	);

PROCESS(CLK25)
BEGIN

if(READY = '0') THEN
	NULL;

ELSIF(RISING_EDGE(CLK25)) THEN

	IF(HCOUNT < 2200) THEN
		HCOUNT <= HCOUNT + 1;
	ELSE 
		HCOUNT <= 0;
		IF(VCOUNT < 1125) THEN
		VCOUNT <= VCOUNT + 1;
		ELSE 
		VCOUNT <= 0;
		END IF;
	END IF;
	
	IF(HCOUNT > 87 AND HCOUNT < 132) THEN
		HS <= '0';
	ELSE HS <= '1';
	END IF;
	
	IF(VCOUNT > 1083 AND VCOUNT < 1089) THEN
		VS <= '0';
	ELSE VS <= '1';
	END IF;
	
	IF((HCOUNT > 0 AND HCOUNT < 280) or (VCOUNT > 1079 AND VCOUNT < 1125)) THEN
	
		VGA_R <= '0';
		VGA_G <= '0';
		VGA_B <= '0';
		END IF;
		
	IF((HCOUNT > 279 AND HCOUNT < 2200) and (VCOUNT > 0 AND VCOUNT < 1080)) THEN 
	
		VGA_R <= '0';
		VGA_G <= '0';
		VGA_B <= '0';
		
	END IF;
	IF((HCOUNT = 1440 OR  VCOUNT = 540))then
		VGA_R <= '1';
		VGA_G <= '1';
		VGA_B <= '1';
	
	--IF(HCOUNT > 500 AND HCOUNT < 1000 AND VCOUNT > 400 AND VCOUNT  )
	
	END IF;
		END IF;

END PROCESS;
end Behavioral;

