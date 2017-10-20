----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:19:53 10/20/2017 
-- Design Name: 
-- Module Name:    keySchedule - Behavioral 
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

entity keySchedule is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           roundNumber : in  STD_LOGIC_VECTOR (3 downto 0);
           originalKey : in  STD_LOGIC_VECTOR (127 downto 0);
           roundKey : out  STD_LOGIC_VECTOR (127 downto 0));
end keySchedule;

architecture Behavioral of keySchedule is

	COMPONENT sbox4B PORT ( 
		clk : in  STD_LOGIC;
		d : in  STD_LOGIC_VECTOR (31 downto 0);
		q : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT sbox4B;

	COMPONENT rcon PORT ( 
		clk : in  STD_LOGIC;
		roundNumber : in STD_LOGIC_VECTOR(3 downto 0);
		d : in  STD_LOGIC_VECTOR (31 downto 0);
		q : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT rcon;

	-- wiring to connect the modules
	signal to_sbox4B 	: STD_LOGIC_VECTOR( 31 downto 0) := (others => '0');
	signal from_sbox4B: STD_LOGIC_VECTOR( 31 downto 0) := (others => '0');
	signal from_rcon 	: STD_LOGIC_VECTOR( 31 downto 0) := (others => '0');
	signal q 			: STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
begin

to_sbox4B <= originalKey(23 downto 0) & originalKey(31 downto 24);

subKeyBytes : sbox4B port map (clk, to_sbox4B, from_sbox4B); 
rconBytes   : rcon	port map (clk, roundNumber, from_sbox4B, from_rcon);

q(127 downto 96) <= from_rcon      	 xor originalKey(127 downto 96);
q( 95 downto 64) <= q(127 downto 96) xor originalKey( 95 downto 64);
q( 63 downto 32) <= q( 95 downto 64) xor originalKey( 63 downto 32);
q( 31 downto  0) <= q( 63 downto 32) xor originalKey( 31 downto  0);
roundKey <= q;
end Behavioral;
