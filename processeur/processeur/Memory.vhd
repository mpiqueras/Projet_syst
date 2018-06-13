----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:12 05/30/2018 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
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

entity Memory is
Port( DATA_DO : in  STD_LOGIC_VECTOR (15 downto 0);
	DATA_A : in  STD_LOGIC_VECTOR (8 downto 0);
	DATA_WE : in  STD_LOGIC;
	DATA_DI : out  STD_LOGIC_VECTOR (15 downto 0);
	CLK : in STD_LOGIC
		);
end Memory;

architecture Behavioral of Memory is
type tabMemory    is array(0 to 2**8) of std_logic_vector(15 downto 0);
signal mem  :   tabMemory := (others=>X"0000");
begin 
	process
		begin
		wait until clk'event and clk='1';
			if (DATA_WE='1') then
					mem(to_integer(unsigned(DATA_A))) <= DATA_DO;
			end if;		
			DATA_DI <= mem(to_integer(unsigned(DATA_A))); 			
	end process;
	
end Behavioral;

