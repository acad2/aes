--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:49:48 12/10/2017
-- Design Name:   
-- Module Name:   E:/aes/topLevelTest.vhd
-- Project Name:  aes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: toplevel
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
 
ENTITY topLevelTest IS
END topLevelTest;
 
ARCHITECTURE behavior OF topLevelTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT toplevel
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         enc : IN  std_logic;
         done : OUT  std_logic;
         r : OUT  std_logic_vector(3 downto 0);
         originalKey : IN  std_logic_vector(127 downto 0);
         intext : IN  std_logic_vector(127 downto 0);
         outtext : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '1';
   signal enc : std_logic := '0';
   signal originalKey : std_logic_vector(127 downto 0) := (others => '0');
   signal intext : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal done : std_logic;
   signal r : std_logic_vector(3 downto 0);
   signal outtext : std_logic_vector(127 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: toplevel PORT MAP (
          clk => clk,
          clr => clr,
          enc => enc,
          done => done,
          r => r,
          originalKey => originalKey,
          intext => intext,
          outtext => outtext
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
		originalKey <= x"5468617473206D79204B756E67204675";
		intext      <= x"54776F204F6E65204E696E652054776F";
		enc <= '1';
		

      wait for clk_period*3;
		clr <= '0';
		
		wait for clk_period*30;
		intext <= x"29C3505F571420F6402299B31A02D73A";
		enc <= '0';
		clr <= '1';
		
		wait for clk_period*3;
		clr<= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
