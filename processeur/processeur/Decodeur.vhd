----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:32 05/29/2018 
-- Design Name: 
-- Module Name:    Decodeur - Behavioral 
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

entity Decodeur is
	Port( OP: out  STD_LOGIC_VECTOR (7 downto 0);
	A: out  STD_LOGIC_VECTOR (15 downto 0);
	B: out  STD_LOGIC_VECTOR (15 downto 0);
	C: out  STD_LOGIC_VECTOR (15 downto 0);
	INST: in  STD_LOGIC_VECTOR (31 downto 0) 
		);
end Decodeur;

architecture Behavioral of Decodeur is
	signal aux : STD_LOGIC_VECTOR (7 downto 0);
begin
	aux <= INST(31 downto 24);
	OP <= INST(31 downto 24);
	A <= INST(23 downto 8) when(aux=X"08" OR aux=X"0E" OR aux=X"0F") 
		else X"00"&INST(23 downto 16);
	B <= INST(15 downto 0) when (aux=X"06" OR aux=X"07") 
		else X"00"&INST(7 downto 0) when (aux=X"08" OR aux=X"0E" OR aux=X"0F") 
		else X"00"&INST(15 downto 8);
	C <= X"00"&INST(7 downto 0) when (aux=X"01" OR aux=X"02" OR aux=X"03" OR aux=X"04" OR aux=X"09" OR aux=X"0A" OR aux=X"0B" OR aux=X"0C" OR aux=X"0D");
end Behavioral;

