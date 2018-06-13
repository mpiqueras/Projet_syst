----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:00:13 06/04/2018 
-- Design Name: 
-- Module Name:    Alea - Behavioral 
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

entity Alea is
PORT( OPLidi : in  STD_LOGIC_VECTOR (7 downto 0);
OPDiex : in  STD_LOGIC_VECTOR (7 downto 0);
OPExmem : in  STD_LOGIC_VECTOR (7 downto 0);
OPMemre : in  STD_LOGIC_VECTOR (7 downto 0);
BLidi : in  STD_LOGIC_VECTOR (15 downto 0);
CLidi : in  STD_LOGIC_VECTOR (15 downto 0);
ADiex : in  STD_LOGIC_VECTOR (15 downto 0);
AExmem : in  STD_LOGIC_VECTOR (15 downto 0);
AMemre : in  STD_LOGIC_VECTOR (15 downto 0);
ALEA : out  STD_LOGIC 
);
end Alea;

architecture Behavioral of Alea is
	signal aux : STD_LOGIC :='0';
	signal lidiRead : STD_LOGIC :='0';
	signal diexWrite : STD_LOGIC :='0';
	signal exmemWrite : STD_LOGIC :='0';
	signal memreWrite : STD_LOGIC :='0';
begin
 lidiRead <= '1' when((OPLidi=X"01" OR OPLidi=X"02" OR OPLidi=X"03" OR OPLidi=X"05" OR OPLidi=X"08")) else '0';
 diexWrite <= '1' when((OPDiex=X"01" OR OPDiex=X"02" OR OPDiex=X"03" OR OPDiex=X"05" OR OPDiex=X"06" OR OPDiex=X"07")) else '0';
 exmemWrite <= '1' when((OPExmem=X"01" OR OPExmem=X"02" OR OPExmem=X"03" OR OPExmem=X"05" OR OPExmem=X"06" OR OPExmem=X"07")) else '0';
 memreWrite <= '1' when((OPMemre=X"01" OR OPMemre=X"02" OR OPMemre=X"03" OR OPMemre=X"05" OR OPMemre=X"06" OR OPMemre=X"07")) else '0';
 aux <= '1' when ((lidiRead='1' AND diexWrite='1' AND ((BLidi=ADiex) OR (CLidi=ADiex))) 
 OR (lidiRead='1' AND exmemWrite='1' AND ((BLidi=AExmem) OR (CLidi=AExmem))) 
 OR (lidiRead='1' AND memreWrite='1' AND ((BLidi=AMemre) OR (CLidi=AMemre)))) 
 else '0';
 ALEA <= aux;
end Behavioral;

