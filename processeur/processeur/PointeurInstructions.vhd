----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:20 06/01/2018 
-- Design Name: 
-- Module Name:    PointeurInstructions - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PointeurInstructions is
	Port ( CLK : in  STD_LOGIC;
  RST : in  STD_LOGIC;
  LOAD : in  STD_LOGIC;
  EN : in  STD_LOGIC;
  ALEA : in STD_LOGIC ;
  Din : in  STD_LOGIC_VECTOR (7 downto 0);
  Dout : out  STD_LOGIC_VECTOR (7 downto 0));
end PointeurInstructions;

architecture Behavioral of PointeurInstructions is

signal aux : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin	
	process
		begin 
		wait until clk'event and clk='1';
			if alea='0' then
				if rst='0' then aux <= "00000000";
				elsif load='1' then	aux <= Din;
				elsif en='0' then aux <= aux+1;
				end if;
			end if;
	end process;
	Dout <= aux;
end Behavioral;
