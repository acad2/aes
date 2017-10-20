----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:06:53 10/20/2017 
-- Design Name: 
-- Module Name:    mux16B2x1 - Behavioral 
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

entity mux16B2x1 is
    Port ( sel : in  STD_LOGIC_VECTOR (3 downto 0);
           d0 : in  STD_LOGIC_VECTOR (127 downto 0);
           d1 : in  STD_LOGIC_VECTOR (127 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0));
end mux16B2x1;

architecture Behavioral of mux16B2x1 is

begin
	-- might be nice to add sel = X"b" in order to adjust for hardware delays when switching mux
	q <= d0 when (sel = X"0" or sel = X"b") else d1;

end Behavioral;

