--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:05:51 05/29/2018
-- Design Name:   
-- Module Name:   /home/mgirard/Bureau/4eme_A/Projet-compil/processeur/processeur/TestDecodeur.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decodeur
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
 
ENTITY TestDecodeur IS
END TestDecodeur;
 
ARCHITECTURE behavior OF TestDecodeur IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decodeur
    PORT(
         OP : OUT  std_logic_vector(7 downto 0);
         A : OUT  std_logic_vector(15 downto 0);
         B : OUT  std_logic_vector(15 downto 0);
         C : OUT  std_logic_vector(15 downto 0);
         INST : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INST : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal OP : std_logic_vector(7 downto 0);
   signal A : std_logic_vector(15 downto 0);
   signal B : std_logic_vector(15 downto 0);
   signal C : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decodeur PORT MAP (
          OP => OP,
          A => A,
          B => B,
          C => C,
          INST => INST
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		-- ADD
      wait for 50 ns;	
		INST <= X"01020304";
		-- MUL
		wait for 50 ns;	
		INST <= X"02030405";
		-- SOU
		wait for 50 ns;	
		INST <= X"03040506";
		-- DIV
		wait for 50 ns;	
		INST <= X"04050607";
		-- COP
		wait for 50 ns;	
		INST <= X"05010200";
		-- AFC
		wait for 50 ns;	
		INST <= X"06011234";
		-- LOAD
		wait for 50 ns;	
		INST <= X"07020008";
		-- STORE
		wait for 50 ns;	
		INST <= X"08000408";
		-- EQU
		wait for 50 ns;	
		INST <= X"09010305";
		-- INF
		wait for 50 ns;	
		INST <= X"0A020406";
		-- INFE
		wait for 50 ns;	
		INST <= X"0B030507";
		-- SUP
		wait for 50 ns;	
		INST <= X"0C040608";
		-- SUPE
		wait for 50 ns;	
		INST <= X"0D050709";
		-- JMP
		wait for 50 ns;	
		INST <= X"0E111100";
		-- JMPC
		wait for 50 ns;	
		INST <= X"0F222242";

      wait;
   end process;

END;
