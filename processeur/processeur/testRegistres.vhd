--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:39:06 05/15/2018
-- Design Name:   
-- Module Name:   /home/mgirard/Bureau/4eme_A/Projet-compil/processeur/processeur/testRegistres.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registres
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
 
ENTITY testRegistres IS
END testRegistres;
 
ARCHITECTURE behavior OF testRegistres IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registres
    PORT(
         adrA : IN  std_logic_vector(3 downto 0);
         adrB : IN  std_logic_vector(3 downto 0);
         adrW : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         RST : IN  std_logic;
         DATA : IN  std_logic_vector(15 downto 0);
         QA : OUT  std_logic_vector(15 downto 0);
         QB : OUT  std_logic_vector(15 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal adrA : std_logic_vector(3 downto 0) := (others => '0');
   signal adrB : std_logic_vector(3 downto 0) := (others => '0');
   signal adrW : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal RST : std_logic := '0';
   signal DATA : std_logic_vector(15 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(15 downto 0);
   signal QB : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registres PORT MAP (
          adrA => adrA,
          adrB => adrB,
          adrW => adrW,
          W => W,
          RST => RST,
          DATA => DATA,
          QA => QA,
          QB => QB,
          CLK => CLK
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
		RST<='1';		
		W<='1';
		adrW<=X"1";
		DATA<=X"0042";
		wait for 100 ns;	
		W<='0';
		adrA<=X"1";
		adrB<=X"2";
		wait for 100 ns;	
		RST<='0';
		wait for 100 ns;	
		RST<='1';
		W<='1';
		adrA<=X"3";
		adrW<=X"3";
		DATA<=X"0047";
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
