----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:10 05/15/2018 
-- Design Name: 
-- Module Name:    registres - Behavioral 
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

entity registres is
	Port(
	adrA: in  STD_LOGIC_VECTOR (3 downto 0);
	adrB: in  STD_LOGIC_VECTOR (3 downto 0);
	adrW: in  STD_LOGIC_VECTOR (3 downto 0);
	W: in STD_LOGIC;
	RST: in STD_LOGIC;
	DATA : in  STD_LOGIC_VECTOR (15 downto 0);
	QA: out  STD_LOGIC_VECTOR (15 downto 0);
	QB: out  STD_LOGIC_VECTOR (15 downto 0);
	CLK : in  STD_LOGIC
	);
end registres;

architecture Behavioral of registres is
type tabRegistres    is array(15 downto 0) of std_logic_vector(15 downto 0);
signal regs  :   tabRegistres;
begin
	process
		begin
		wait until clk'event and clk='1';
		if (RST='0') then 
			regs <= (others=>X"0000");
		else
			if (W='1') then
				regs(to_integer(unsigned(adrW))) <= DATA;
			end if;
		end if;
	end process;
	QA <= DATA when (adrA=adrW and W='1') else
			regs(to_integer(unsigned(adrA)));			
	QB <= DATA when (adrB=adrW and W='1') else
			regs(to_integer(unsigned(adrB)));
	
end Behavioral;

