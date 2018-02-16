----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:26:30 11/30/2017 
-- Design Name: 
-- Module Name:    invSbox16B - Behavioral 
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

entity invSbox16B is
    Port ( d : in  STD_LOGIC_VECTOR (127 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0));
end invSbox16B;

architecture Behavioral of invSbox16B is

	COMPONENT invSbox4B PORT ( 
		d : in  STD_LOGIC_VECTOR (31 downto 0);
		q : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT invSbox4B;
begin

invSbox4B0: invSbox4B port map(d(127 downto 96), q(127 downto 96));
invSbox4B1: invSbox4B port map(d( 95 downto 64), q( 95 downto 64));
invSbox4B2: invSbox4B port map(d( 63 downto 32), q( 63 downto 32));
invSbox4B3: invSbox4B port map(d( 31 downto  0), q( 31 downto  0));

end Behavioral;

