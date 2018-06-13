----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:48 05/14/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
Port( OP: in  STD_LOGIC_VECTOR (7 downto 0);
	A: in  STD_LOGIC_VECTOR (15 downto 0);
	B: in  STD_LOGIC_VECTOR (15 downto 0);
	S: out  STD_LOGIC_VECTOR (15 downto 0);
	FLAG: out  STD_LOGIC_VECTOR (15 downto 0)
		);
end ALU;

architecture Behavioral of ALU is
signal R : STD_LOGIC_VECTOR (15 downto 0);
signal Rmul : STD_LOGIC_VECTOR (31 downto 0);
signal Radd : STD_LOGIC_VECTOR (16 downto 0);
signal Rsub : STD_LOGIC_VECTOR (16 downto 0);
signal Flag_n,Flag_o,Flag_z,Flag_c : STD_LOGIC; 
begin
	Radd<=('0'&A)+('0'&B) when(OP = X"01") else "00000000000000000";
	Rsub<=('0'&A)-('0'&B) when(OP = X"03") else "00000000000000000";
	Rmul<= A*B when (OP = X"02") else X"00000000";
	R <= 	Radd(15 downto 0) when (OP = X"01") else
			Rmul(15 downto 0) when (OP = X"02") else
			Rsub(15 downto 0) when (OP = X"03");
	Flag_n <= '1' when (R(15)='1') else '0';
	Flag_o <= '1' when (Radd>X"0FFFF" or Rsub>X"0FFFF" or Rmul>X"0000FFFF") else '0';
	Flag_z <= '1' when (R=X"0000") else '0';
	Flag_c <= '1' when ((OP=X"01") and (Radd>X"0FFFF")) else '0';
	FLAG <= "000000000000"&Flag_n&Flag_o&Flag_z&Flag_c;
	S <= R;
end Behavioral;

