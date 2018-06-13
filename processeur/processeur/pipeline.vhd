----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:00 05/14/2018 
-- Design Name: 
-- Module Name:    pipeline - Behavioral 
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

entity pipeline is
	Port( POP_IN : in  STD_LOGIC_VECTOR (7 downto 0);
	POP_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
	PA_IN : in  STD_LOGIC_VECTOR (15 downto 0);
	PA_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
	PB_IN : in  STD_LOGIC_VECTOR (15 downto 0);
	PB_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
	PS_IN : in  STD_LOGIC_VECTOR (15 downto 0);
	PS_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
	PFLAG_IN : in  STD_LOGIC_VECTOR (15 downto 0);
	PFLAG_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
	CLK : in  STD_LOGIC
		);
end pipeline;

architecture Behavioral of pipeline is

begin
	process
		begin
		wait until clk'event and clk='1';
			POP_OUT <= POP_IN;
			PA_OUT <= PA_IN;
			PB_OUT <= PB_IN;
			PS_OUT <= PS_IN;
			PFLAG_OUT <= PFLAG_IN;
	end process;

end Behavioral;

