----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:40:48 05/29/2018 
-- Design Name: 
-- Module Name:    Processeur - Behavioral 
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

entity Processeur is
	Port( 
	CLK : in  STD_LOGIC;
	RST : in  STD_LOGIC;
	LOAD : in  STD_LOGIC;
	EN : in  STD_LOGIC;
	Din : in  STD_LOGIC_VECTOR (7 downto 0)
	);
end Processeur;

architecture Behavioral of Processeur is
   -- Listes Des composants
 
    COMPONENT ALU
    PORT(
         OP : IN  std_logic_vector(7 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         S : OUT  std_logic_vector(15 downto 0);
         FLAG : OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
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

	 COMPONENT Decodeur
    PORT(
         OP : OUT  std_logic_vector(7 downto 0);
         A : OUT  std_logic_vector(15 downto 0);
         B : OUT  std_logic_vector(15 downto 0);
         C : OUT  std_logic_vector(15 downto 0);
         INST : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
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
	 
	 COMPONENT Memory
    PORT(
         DATA_DO : in  STD_LOGIC_VECTOR (15 downto 0);
			DATA_A : in  STD_LOGIC_VECTOR (8 downto 0);
			DATA_WE : in  STD_LOGIC;
			DATA_DI : out  STD_LOGIC_VECTOR (15 downto 0);
			CLK : in STD_LOGIC
    );
    END COMPONENT;
	 
	 COMPONENT MemoireInstruction
	 PORT( INSTR_A : in  STD_LOGIC_VECTOR (7 downto 0);
		INSTR_DO : out  STD_LOGIC_VECTOR (31 downto 0)
	 );
	 END COMPONENT;
	 
	 COMPONENT PointeurInstructions
	 PORT ( CLK : in  STD_LOGIC;
	 RST : in  STD_LOGIC;
	 LOAD : in  STD_LOGIC;
	 EN : in  STD_LOGIC;
	 ALEA : IN std_logic;
	 Din : in  STD_LOGIC_VECTOR (7 downto 0);
	 Dout : out  STD_LOGIC_VECTOR (7 downto 0)
	 );
	 END COMPONENT;
	 
	 COMPONENT Alea
	 PORT ( 
	 OPLidi : in  STD_LOGIC_VECTOR (7 downto 0);
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
	 END COMPONENT;
    

   --Signaux Registres
	signal S : std_logic_vector(15 downto 0);
   signal QA : std_logic_vector(15 downto 0);
   signal QB : std_logic_vector(15 downto 0);
	signal PFLAG_IN : std_logic_vector(15 downto 0);
   signal PFLAG_OUT : std_logic_vector(15 downto 0);

   --Signaux ALU
   signal FLAG : std_logic_vector(15 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
	--Signaux IP
	 signal Dout : std_logic_vector(7 downto 0) := (others => '0');
	 
	 --Signaux MemIntrs
	signal INSTR_DO : std_logic_vector(31 downto 0) := (others => '0');
	
	signal OPW : std_logic := '0';
	signal AADRW : std_logic_vector (3 downto 0) := X"0";
	signal BADRA : std_logic_vector (3 downto 0) := X"0";
	signal CADRB : std_logic_vector (3 downto 0) := X"0";
	signal MUXREG : std_logic_vector (15 downto 0) := X"0000";
	signal MUXALU : std_logic_vector (15 downto 0) := X"0000";
	signal MUXLOAD : std_logic_vector (15 downto 0) := X"0000";
	signal MUXSTORE : std_logic_vector (15 downto 0) := X"0000";
	signal DATA_DI : std_logic_vector (15 downto 0);
	signal DATA_WE : std_logic := '0';
	
	--Signaux alea
	signal BITALEA : std_logic := '0';
	
	--Signaux spéciaux pour lidi (aléa)
   signal lidiOutOp : std_logic_vector (7 downto 0);
	signal lidiOutA : std_logic_vector (15 downto 0);
	signal lidiOutB : std_logic_vector (15 downto 0);
	signal lidiOutC : std_logic_vector (15 downto 0);
	
	type pipe is record
		op : std_logic_vector(7 downto 0); 
		a,b,c : std_logic_vector(15 downto 0);
	end record;	
	signal li, di, ex, mem, re: pipe;
	
begin
	OPW <= '1' when (re.op=X"01" OR re.op=X"02" OR re.op=X"03" OR re.op=X"05" OR re.op=X"06" OR re.op=X"07") else '0';
	AADRW <= re.a(3 downto 0);
	BADRA <= di.b(3 downto 0);
	CADRB <= di.c(3 downto 0);
	MUXREG <= QA when(di.op=X"01" OR di.op=X"02" OR di.op=X"03" OR di.op=X"04" OR di.op=X"05" OR di.op=X"08") else di.b;
	MUXALU <= S when(ex.op=X"01" OR ex.op=X"02" OR ex.op=X"03" OR ex.op=X"04") else ex.b;
	MUXLOAD <= DATA_DI when(re.op=X"07") else re.b; 
	MUXSTORE <= mem.a when(mem.op=X"08") else mem.b;
	DATA_WE <= '1' when (mem.op=X"08") else '0';
	lidiOutOp <= li.op when (BITALEA='0') else X"00";
	lidiOutA <= li.a when (BITALEA='0') else X"0000";
	lidiOutB <= li.b when (BITALEA='0') else X"0000";
	lidiOutC <= li.c when (BITALEA='0') else X"0000";
	
	--Instanciations 
   dec: Decodeur PORT MAP (
          OP => li.op,
          A => li.a,
          B => li.b,
          C => li.c,
          INST => INSTR_DO 
        );  

	lidi: pipeline PORT MAP (
          POP_IN => lidiOutOp,
          POP_OUT => di.op,
          PA_IN => lidiOutA,
          PA_OUT => di.a,
          PB_IN => lidiOutB,
          PB_OUT => di.b,
          PS_IN => lidiOutC,
          PS_OUT => di.c,
          PFLAG_IN => PFLAG_IN,
          PFLAG_OUT => PFLAG_OUT,
          CLK => CLK
        );
	reg: registres PORT MAP (
          adrA => BADRA,
          adrB => CADRB,
          adrW => AADRW,
          W => OPW,
          RST => RST,
          DATA => MUXLOAD,
          QA => QA,
          QB => QB,
          CLK => CLK
        );  
		  
	diex: pipeline PORT MAP (
          POP_IN => di.op,
          POP_OUT => ex.op,
          PA_IN => di.a,
          PA_OUT => ex.a,
          PB_IN => MUXREG,
          PB_OUT => ex.b,
          PS_IN => QB,
          PS_OUT => ex.c,
          PFLAG_IN => PFLAG_IN,
          PFLAG_OUT => PFLAG_OUT,
          CLK => CLK
        );
	calc: ALU PORT MAP (
          OP => ex.op,
          A => ex.b,
          B => ex.c,
          S => S,
          FLAG => FLAG
        );
	exmem: pipeline PORT MAP (
          POP_IN => ex.op,
          POP_OUT => mem.op,
          PA_IN => ex.a,
          PA_OUT => mem.a,
          PB_IN => MUXALU,
          PB_OUT => mem.b,
          PS_IN => ex.c,
          PS_OUT => mem.c,
          PFLAG_IN => PFLAG_IN,
          PFLAG_OUT => PFLAG_OUT,
          CLK => CLK
        );
	memre: pipeline PORT MAP (
          POP_IN => mem.op,
          POP_OUT => re.op,
          PA_IN => mem.a,
          PA_OUT => re.a,
          PB_IN => mem.b,
          PB_OUT => re.b,
          PS_IN =>  mem.c,
          PS_OUT => re.c,
          PFLAG_IN => PFLAG_IN,
          PFLAG_OUT => PFLAG_OUT,
          CLK => CLK
        );

	memor: memory PORT MAP	(
		DATA_DO => mem.b,
		DATA_A => MUXSTORE(8 downto 0),
		DATA_WE => DATA_WE,  
		DATA_DI => DATA_DI,
		CLK => CLK
	);
	
	ip : PointeurInstructions PORT MAP(
	 CLK => CLK,
	 RST => RST,
	 LOAD => LOAD,
	 EN => EN,
	 ALEA => BITALEA,
	 Din  => Din,
	 Dout => Dout
	);
	
	instrs : memoireInstruction PORT MAP(
		INSTR_A => Dout,
		INSTR_DO => INSTR_DO 
	);
	
	gestAlea : alea PORT MAP (
		OPLidi => li.op,
		OPDiex => di.op,
		OPExmem => ex.op,
		OPMemre => mem.op,
		BLidi => li.b,
		CLidi => li.c,
		ADiex => di.a,
		AExmem => ex.a,
		AMemre => mem.a,
		ALEA => BITALEA
	);

end Behavioral;

