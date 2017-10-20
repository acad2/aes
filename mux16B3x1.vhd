----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:08:01 10/21/2017 
-- Design Name: 
-- Module Name:    mux16B3x1 - Behavioral 
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

entity mux16B3x1 is
    Port ( sel: in  STD_LOGIC_VECTOR (  3 downto 0);
           d0 : in  STD_LOGIC_VECTOR (127 downto 0);
           d1 : in  STD_LOGIC_VECTOR (127 downto 0);
           dA : in  STD_LOGIC_VECTOR (127 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0));
end mux16B3x1;

architecture Behavioral of mux16B3x1 is

begin

	with sel select
		q <= 	d0  when "0000",
				dA  when "1010",
				d1  when others;
				
end Behavioral;

