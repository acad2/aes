----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:26:35 11/30/2017 
-- Design Name: 
-- Module Name:    invMixColumns4B - Behavioral 
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

entity invMixColumns4B is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           q : out  STD_LOGIC_VECTOR (31 downto 0));
end invMixColumns4B;

architecture Behavioral of invMixColumns4B is

	COMPONENT x0E PORT ( 
		d : in  STD_LOGIC_VECTOR (7 downto 0);
		q : out STD_LOGIC_VECTOR (7 downto 0));
	END COMPONENT x0E;
	
	COMPONENT x0B PORT ( 
		d : in  STD_LOGIC_VECTOR (7 downto 0);
		q : out STD_LOGIC_VECTOR (7 downto 0));
	END COMPONENT x0B;
	
	COMPONENT x0D PORT ( 
		d : in  STD_LOGIC_VECTOR (7 downto 0);
		q : out STD_LOGIC_VECTOR (7 downto 0));
	END COMPONENT x0D;
	
	COMPONENT x09 PORT ( 
		d : in  STD_LOGIC_VECTOR (7 downto 0);
		q : out STD_LOGIC_VECTOR (7 downto 0));
	END COMPONENT x09;
	
	signal b0x0E : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b1x0E : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b2x0E : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b3x0E : STD_LOGIC_VECTOR(7 downto 0) := X"00";	
	signal b0x0B : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b1x0B : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b2x0B : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b3x0B : STD_LOGIC_VECTOR(7 downto 0) := X"00";		
	signal b0x0D : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b1x0D : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b2x0D : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b3x0D : STD_LOGIC_VECTOR(7 downto 0) := X"00";	
	signal b0x09 : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b1x09 : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b2x09 : STD_LOGIC_VECTOR(7 downto 0) := X"00";
	signal b3x09 : STD_LOGIC_VECTOR(7 downto 0) := X"00";	
begin

b0x0Elut: x0E port map(d(31 downto 24), b0x0E); 
b1x0Elut: x0E port map(d(23 downto 16), b1x0E); 
b2x0Elut: x0E port map(d(15 downto  8), b2x0E); 
b3x0Elut: x0E port map(d( 7 downto  0), b3x0E); 

b0x0Blut: x0B port map(d(31 downto 24), b0x0B); 
b1x0Blut: x0B port map(d(23 downto 16), b1x0B); 
b2x0Blut: x0B port map(d(15 downto  8), b2x0B); 
b3x0Blut: x0B port map(d( 7 downto  0), b3x0B); 

b0x0Dlut: x0D port map(d(31 downto 24), b0x0D); 
b1x0Dlut: x0D port map(d(23 downto 16), b1x0D); 
b2x0Dlut: x0D port map(d(15 downto  8), b2x0D); 
b3x0Dlut: x0D port map(d( 7 downto  0), b3x0D); 

b0x09lut: x09 port map(d(31 downto 24), b0x09); 
b1x09lut: x09 port map(d(23 downto 16), b1x09); 
b2x09lut: x09 port map(d(15 downto  8), b2x09); 
b3x09lut: x09 port map(d( 7 downto  0), b3x09); 

	q(31 downto 24) <=  b0x0E xor b1x0B xor b2x0D xor b3x09; 
	q(23 downto 16) <=  b0x09 xor b1x0E xor b2x0B xor b3x0D; 
	q(15 downto  8) <=  b0x0D xor b1x09 xor b2x0E xor b3x0B;  
	q( 7 downto  0) <=  b0x0B xor b1x0D xor b2x09 xor b3x0E; 

end Behavioral;

