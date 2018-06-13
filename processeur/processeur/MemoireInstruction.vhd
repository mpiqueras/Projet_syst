----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:59 06/01/2018 
-- Design Name: 
-- Module Name:    MemoireInstruction - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MemoireInstruction is
PORT( INSTR_A : in  STD_LOGIC_VECTOR (7 downto 0);
		INSTR_DO : out  STD_LOGIC_VECTOR (31 downto 0)
);

end MemoireInstruction;

architecture Behavioral of MemoireInstruction is
type tabInstructions    is array(255 downto 0) of std_logic_vector(31 downto 0);
signal instrs :   tabInstructions := 
							(
							 0=>X"06010004",
							 1=>X"05020100",
							 2=>X"01030102",
							 3=>X"02040101",
							 4=>X"03050301",
							 5=>X"08002204",
							 6=>X"07060022",
							 others=>X"FFFFFFFF");

begin
--instrs(0) <= X"06010004";
--instrs(1) <= X"05020100";
--instrs(2) <= X"01030102";
--instrs(3) <= X"02040101";
--instrs(4) <= X"03050301";
--instrs(5) <= X"08002301";
--instrs(6) <= X"07060023";
INSTR_DO <= instrs(to_integer(unsigned(INSTR_A))); 
end Behavioral;

