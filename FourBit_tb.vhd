--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:27:05 05/31/2018
-- Design Name:   
-- Module Name:   C:/Users/Shambhavi/Documents/xilinx/registerFourBit/FourBit_tb.vhd
-- Project Name:  registerFourBit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FourBit_tb IS
END FourBit_tb;
 
ARCHITECTURE behavior OF FourBit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBit
    PORT(
         ip : IN  std_logic_vector(3 downto 0);
         op : OUT  std_logic_vector(3 downto 0);
         enable : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ip : std_logic_vector(3 downto 0) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal op : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBit PORT MAP (
          ip => ip,
          op => op,
          enable => enable
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
 --  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

--      wait for <clock>_period*10;

      -- insert stimulus here 
		ip <= "0001";
		enable <= '1';
		wait for 10ms;
		
		enable <= '0';
		ip <= "1000";
		wait for 10ms;

      wait;
   end process;

END;
