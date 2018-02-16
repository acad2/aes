----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:40 12/01/2017 
-- Design Name: 
-- Module Name:    decrypt - Behavioral 
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

entity decrypt is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           roundNumber : in  STD_LOGIC_VECTOR (3 downto 0);
           roundKey : in  STD_LOGIC_VECTOR (127 downto 0);
           ciphertext : in  STD_LOGIC_VECTOR (127 downto 0);
           plaintext : out  STD_LOGIC_VECTOR (127 downto 0));
end decrypt;

architecture Behavioral of decrypt is
	
	COMPONENT invSbox16B PORT ( 
		d : in  STD_LOGIC_VECTOR (127 downto 0);
		q : out  STD_LOGIC_VECTOR (127 downto 0));
	END COMPONENT invSbox16B;

	COMPONENT invShiftRows PORT ( 
		d : in  STD_LOGIC_VECTOR (127 downto 0);
		q : out  STD_LOGIC_VECTOR (127 downto 0));
	END COMPONENT invShiftRows;
	
	COMPONENT invMixColumns PORT (
		d : in  STD_LOGIC_VECTOR (127 downto 0);
		q : out STD_LOGIC_VECTOR (127 downto 0));
	END COMPONENT invMixColumns;
	
	signal from_addRoundKey : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal from_register : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal from_invSubBytes : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal from_invShiftRows : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal from_invMixColumns : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal to_invShiftRows : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal to_storedState : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal storedState : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal output : STD_LOGIC_VECTOR (127 downto 0) := (others => '0');
	signal en : STD_LOGIC := '0';
begin

with roundNumber select
	to_storedState <= ciphertext when x"B", ciphertext when x"0", from_invSubBytes when others;
	
to_invShiftRows <= from_addRoundKey when (roundNumber = x"A") else from_invMixColumns;

PROCESS (clr, clk, roundNumber)
BEGIN
	if clr='1' then
			en <= '0';
	elsif rising_edge(clk) then
		if roundNumber = x"0" then
			output <= from_addRoundKey;
		end if;
		storedState <= to_storedState;
	end if;
END PROCESS;

from_addRoundKey <= (ciphertext xor roundKey) when (roundNumber = x"A") else (storedState xor roundKey) ;
invMixColumnsLayer: invMixColumns port map(from_addRoundKey, from_invMixColumns);
invShiftRowsLayer : invShiftRows port map(to_invShiftRows, from_invShiftRows);
invSubBytesLayer  : invSbox16B port map(from_invShiftRows, from_invSubBytes);

plaintext <= roundKey;
end Behavioral;

