--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:05:12 05/14/2018
-- Design Name:   
-- Module Name:   /home/mgirard/Bureau/4eme_A/Projet-compil/processeur/processeur/testALU.vhd
-- Project Name:  processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY testALU IS
END testALU;
 
ARCHITECTURE behavior OF testALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         OP : IN  std_logic_vector(7 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         S : OUT  std_logic_vector(15 downto 0);
         FLAG : OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(7 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(15 downto 0) := (others => '0');
   signal FLAG : std_logic_vector(15 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          OP => OP,
          A => A,
          B => B,
          S => S,
          FLAG => FLAG
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		A <= X"0001";
		B <= X"0002";
		OP <=X"01";
      wait for 100 ns;
		A <= X"FFFF";
		B <= X"0002";
		OP <=X"01";
		wait for 100 ns;
		A <= X"FFFD";
		B <= X"0002";
		OP <=X"01";
		wait for 100 ns;
		A <= X"0001";
		B <= X"0002";
		OP <=X"02";
		wait for 100 ns;
		A <= X"FFFF";
		B <= X"0002";
		OP <=X"02";
		wait for 100 ns;
		A <= X"0004";
		B <= X"FFFF";
		OP <=X"02";
		wait for 100 ns;
		A <= X"0005";
		B <= X"0004";
		OP <=X"03";
		wait for 100 ns;
		A <= X"0005";
		B <= X"0005";
		OP <=X"03";
		wait for 100 ns;
		A <= X"0004";
		B <= X"0012";
		OP <=X"03";
		wait for 100 ns;
		A <= X"0004";
		B <= X"FFFF";
		OP <=X"03";


      -- insert stimulus here 

      wait;
   end process;

END;
