----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:40:39 10/20/2017 
-- Design Name: 
-- Module Name:    roundCount - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity roundCount is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  enc  : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end roundCount;

architecture Behavioral of roundCount is
	signal temp : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal up	: STD_LOGIC := '1';
	signal en	: STD_LOGIC := '0';
begin


PROCESS(clk, clr, enc, up)
BEGIN
	if clr='1' then
		temp <= x"B";
		up <= '1';
	elsif rising_edge(clk) then
		if up = '1' then
			if temp = x"B" then
				temp <= x"0";
			else
				temp <= temp + 1;
			end if;
		else
			if temp = x"0" then
				temp <= x"B";
			else
				temp <= temp - 1;
			end if;
		end if;
		if temp = x"B" and enc='0' and up='1' then
			up <= '0';
			temp <= x"B";
		end if;
	end if;
END PROCESS;
	
	q <= temp;

end Behavioral;