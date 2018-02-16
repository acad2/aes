----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:43:20 10/20/2017 
-- Design Name: 
-- Module Name:    toplevel - Behavioral 
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

entity toplevel is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  enc : in  STD_LOGIC;
			  done: out STD_LOGIC;
			  r : out std_logic_vector(3 downto 0);
           originalKey : in  STD_LOGIC_VECTOR (127 downto 0);
           intext : in  STD_LOGIC_VECTOR (127 downto 0);
           outtext : out  STD_LOGIC_VECTOR (127 downto 0));
end toplevel;

architecture Behavioral of toplevel is

	COMPONENT roundCount PORT ( 
		clk : in  STD_LOGIC;
		clr : in  STD_LOGIC;
		enc : in  STD_LOGIC;
		q 	 : out STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT roundCount;

	COMPONENT keySchedule PORT ( 
			clk : in  STD_LOGIC;
			clr : in  STD_LOGIC;
			roundNumber : in  STD_LOGIC_VECTOR (3 downto 0);
			originalKey : in  STD_LOGIC_VECTOR (127 downto 0);
			roundKey : out  STD_LOGIC_VECTOR (127 downto 0));
	END COMPONENT keySchedule;

	COMPONENT encrypt PORT ( 
		clk : in  STD_LOGIC;
		clr : in  STD_LOGIC;
		roundNumber : in  STD_LOGIC_VECTOR (3 downto 0);
		roundKey : in  STD_LOGIC_VECTOR (127 downto 0);
		plaintext : in  STD_LOGIC_VECTOR (127 downto 0);
		ciphertext : out  STD_LOGIC_VECTOR (127 downto 0));
	END COMPONENT encrypt;

	COMPONENT decrypt Port ( 
		clk : in  STD_LOGIC;
		clr : in  STD_LOGIC;
		roundNumber : in  STD_LOGIC_VECTOR (3 downto 0);
		roundKey : in  STD_LOGIC_VECTOR (127 downto 0);
		ciphertext : in  STD_LOGIC_VECTOR (127 downto 0);
		plaintext : out  STD_LOGIC_VECTOR (127 downto 0));
	END COMPONENT decrypt;
	
	signal en : STD_LOGIC := '0';
	signal roundKey	 : STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
	signal roundNumber : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal from_encrypt: STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
	signal from_decrypt: STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
begin

roundCounter:	roundCount  port map(clk, clr, enc, roundNumber);
keyScheduler:	keySchedule port map(clk, clr, roundNumber, originalKey, roundKey);
encrypter:		encrypt     port map(clk, clr, roundNumber, roundKey, intext, from_encrypt);
decrypter:		decrypt		port map(clk, clr, roundNumber, roundKey, intext, from_decrypt);

outtext <= from_encrypt when (enc = '1') else from_decrypt;
done <= '1' when (roundNumber = x"B" and en='1') else '0'; 

PROCESS(clr, clk)
BEGIN
	if (clr = '1') then
		en <= '0';
	elsif rising_edge(clk) then
		if roundNumber = x"B" then
			en <= '1';
		end if;
	end if;
END PROCESS;
r <= roundNumber;

end Behavioral;

