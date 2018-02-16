----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:33 11/30/2017 
-- Design Name: 
-- Module Name:    invMixColumns - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity invMixColumns is
    Port ( d : in  STD_LOGIC_VECTOR (127 downto 0);
           q : out  STD_LOGIC_VECTOR (127 downto 0));
end invMixColumns;

architecture Behavioral of invMixColumns is

	COMPONENT invMixColumns4B Port ( 
		d : in  STD_LOGIC_VECTOR (31 downto 0);
      q : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT invMixColumns4B;

begin

invMixColumns4B0: invMixColumns4B port map (d(127 downto 96), q(127 downto 96));
invMixColumns4B1: invMixColumns4B port map (d( 95 downto 64), q( 95 downto 64));
invMixColumns4B2: invMixColumns4B port map (d( 63 downto 32), q( 63 downto 32));
invMixColumns4B3: invMixColumns4B port map (d( 31 downto  0), q( 31 downto  0));

end Behavioral;

