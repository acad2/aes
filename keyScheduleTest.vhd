--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:23:49 10/20/2017
-- Design Name:   
-- Module Name:   E:/aes/keyScheduleTest.vhd
-- Project Name:  aes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keySchedule
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
 
ENTITY keyScheduleTest IS
END keyScheduleTest;
 
ARCHITECTURE behavior OF keyScheduleTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keySchedule
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         roundNumber : IN  std_logic_vector(3 downto 0);
         originalKey : IN  std_logic_vector(127 downto 0);
         roundKey : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal roundNumber : std_logic_vector(3 downto 0) := (others => '0');
   signal originalKey : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal roundKey : std_logic_vector(127 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keySchedule PORT MAP (
          clk => clk,
          clr => clr,
          roundNumber => roundNumber,
          originalKey => originalKey,
          roundKey => roundKey
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		clr <= '0';
		
		wait for clk_period/2;
		originalKey <= X"5468617473206D79204B756E67204675";
		
		wait for clk_period;
		roundNumber <= X"1";

		wait for clk_period;
		roundNumber <= X"2";
		originalKey <= X"e232fcf191129188b159e4e6d679a293";
      -- insert stimulus here 

      wait;
   end process;

END;
