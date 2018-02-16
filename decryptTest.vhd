--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:43:36 12/10/2017
-- Design Name:   
-- Module Name:   E:/aes/decryptTest.vhd
-- Project Name:  aes
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decrypt
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
 
ENTITY decryptTest IS
END decryptTest;
 
ARCHITECTURE behavior OF decryptTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decrypt
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         roundNumber : IN  std_logic_vector(3 downto 0);
         roundKey : IN  std_logic_vector(127 downto 0);
         ciphertext : IN  std_logic_vector(127 downto 0);
         plaintext : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '1';
   signal roundNumber : std_logic_vector(3 downto 0) := (others => '0');
   signal roundKey : std_logic_vector(127 downto 0) := (others => '0');
   signal ciphertext : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal plaintext : std_logic_vector(127 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decrypt PORT MAP (
          clk => clk,
          clr => clr,
          roundNumber => roundNumber,
          roundKey => roundKey,
          ciphertext => ciphertext,
          plaintext => plaintext
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

      wait for clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
