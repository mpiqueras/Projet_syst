--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:56:26 05/14/2018
-- Design Name:   
-- Module Name:   /home/mgirard/Bureau/4eme_A/Projet-compil/processeur/processeur/testPipeline.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pipeline
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
 
ENTITY testPipeline IS
END testPipeline;
 
ARCHITECTURE behavior OF testPipeline IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pipeline
    PORT(
         POP_IN : IN  std_logic_vector(7 downto 0);
         POP_OUT : OUT  std_logic_vector(7 downto 0);
         PA_IN : IN  std_logic_vector(15 downto 0);
         PA_OUT : OUT  std_logic_vector(15 downto 0);
         PB_IN : IN  std_logic_vector(15 downto 0);
         PB_OUT : OUT  std_logic_vector(15 downto 0);
         PS_IN : IN  std_logic_vector(15 downto 0);
         PS_OUT : OUT  std_logic_vector(15 downto 0);
         PFLAG_IN : IN  std_logic_vector(15 downto 0);
         PFLAG_OUT : OUT  std_logic_vector(15 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal POP_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal PA_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal PB_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal PS_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal PFLAG_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal POP_OUT : std_logic_vector(7 downto 0);
   signal PA_OUT : std_logic_vector(15 downto 0);
   signal PB_OUT : std_logic_vector(15 downto 0);
   signal PS_OUT : std_logic_vector(15 downto 0);
   signal PFLAG_OUT : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pipeline PORT MAP (
          POP_IN => POP_IN,
          POP_OUT => POP_OUT,
          PA_IN => PA_IN,
          PA_OUT => PA_OUT,
          PB_IN => PB_IN,
          PB_OUT => PB_OUT,
          PS_IN => PS_IN,
          PS_OUT => PS_OUT,
          PFLAG_IN => PFLAG_IN,
          PFLAG_OUT => PFLAG_OUT,
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
		POP_IN <= X"01";
		PA_IN <= X"0011";
		PB_IN <= X"0023";
		wait for 100 ns;
		POP_IN <= X"02";
		PA_IN <= X"0005";
		PB_IN <= X"0034";
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
