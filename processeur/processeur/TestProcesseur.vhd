--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:35:06 05/30/2018
-- Design Name:   
-- Module Name:   /home/mgirard/Bureau/4eme_A/Projet-compil/processeur/processeur/TestProcesseur.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processeur
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TestProcesseur IS
END TestProcesseur;
 
ARCHITECTURE behavior OF TestProcesseur IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processeur
    PORT(  
    CLK : in  STD_LOGIC;
	 RST : in  STD_LOGIC;
	 LOAD : in  STD_LOGIC;
	 EN : in  STD_LOGIC;
	 Din : in  STD_LOGIC_VECTOR (7 downto 0)
    );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
	signal EN : std_logic := '0';
	signal LOAD : std_logic := '0';

 	--Outputs

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processeur PORT MAP (
          CLK => CLK,
          RST => RST,
			 LOAD => LOAD,
			 EN => EN,
			 Din => Din
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		--Test1
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
		RST <= '1';
		EN <= '0';
--		INS_DI <= X"06010004";
--      wait for 100 ns;
--		INS_DI <= X"05020100";
--		wait for 100 ns;
--		INS_DI <= X"01030102";
--		wait for 100 ns;
--		INS_DI <= X"02040101";
--		wait for 100 ns;
--		INS_DI <= X"03050301";
--		wait for 100 ns;
--		INS_DI <= X"08002301";
--		wait for 100 ns;
--		INS_DI <= X"07060023";
      

      wait;
   end process;

END;
