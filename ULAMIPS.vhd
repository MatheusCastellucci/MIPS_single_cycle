library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ULAMIPS is
	generic   (
		larguraDados  : natural :=  32
	);

	port   (
		-- Input ports
		inputA, inputB : in  std_logic_vector(larguraDados - 1 downto 0);
		inverteB       : in  std_logic;
		selectMUX      : in  std_logic_vector(1 downto 0);
		
		-- Output ports
		output_ALU     : out std_logic_vector(larguraDados - 1 downto 0);
		z              : out std_logic
	);
end entity;


architecture arch_name of ULAMIPS is

	signal CO_0: std_logic;
	signal CO_1: std_logic;
	signal CO_2: std_logic;
	signal CO_3: std_logic;
	signal CO_4: std_logic;
	signal CO_5: std_logic;
	signal CO_6: std_logic;
	signal CO_7: std_logic;
	signal CO_8: std_logic;
	signal CO_9: std_logic;
	signal CO_10 : std_logic;
	signal CO_11 : std_logic;
	signal CO_12 : std_logic;
	signal CO_13 : std_logic;
	signal CO_14 : std_logic;
	signal CO_15 : std_logic;
	signal CO_16 : std_logic;
	signal CO_17 : std_logic;
	signal CO_18 : std_logic;
	signal CO_19 : std_logic;
	signal CO_20 : std_logic;
	signal CO_21 : std_logic;
	signal CO_22 : std_logic;
	signal CO_23 : std_logic;
	signal CO_24 : std_logic;
	signal CO_25 : std_logic;
	signal CO_26 : std_logic;
	signal CO_27 : std_logic;
	signal CO_28 : std_logic;
	signal CO_29 : std_logic;
	signal CO_30 : std_logic;
	signal overflow_out_31 : std_logic;


	begin

	unidade_bit_ULA31 : entity work.unidade_bit_ULA_OF 
	port map (entradaA => inputA(31), entradaB => inputB(31), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_30, overflow => overflow_out_31, saida => output_ALU(31));

	unidade_bit_ULA30 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(30), entradaB => inputB(30), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_29, carry_out => CO_30, saida => output_ALU(30));

	unidade_bit_ULA29 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(29), entradaB => inputB(29), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_28, carry_out => CO_29, saida => output_ALU(29));

	unidade_bit_ULA28 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(28), entradaB => inputB(28), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_27, carry_out => CO_28, saida => output_ALU(28));

	unidade_bit_ULA27 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(27), entradaB => inputB(27), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_26, carry_out => CO_27, saida => output_ALU(27));	

	unidade_bit_ULA26 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(26), entradaB => inputB(26), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_25, carry_out => CO_26, saida => output_ALU(26));

	unidade_bit_ULA25 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(25), entradaB => inputB(25), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_24, carry_out => CO_25, saida => output_ALU(25));

	unidade_bit_ULA24 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(24), entradaB => inputB(24), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_23, carry_out => CO_24, saida => output_ALU(24));

	unidade_bit_ULA23 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(23), entradaB => inputB(23), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_22, carry_out => CO_23, saida => output_ALU(23));

	unidade_bit_ULA22 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(22), entradaB => inputB(22), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_21, carry_out => CO_22, saida => output_ALU(22));

	unidade_bit_ULA21 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(21), entradaB => inputB(21), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_20, carry_out => CO_21, saida => output_ALU(21));

	unidade_bit_ULA20 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(20), entradaB => inputB(20), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_19, carry_out => CO_20, saida => output_ALU(20));

	unidade_bit_ULA19 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(19), entradaB => inputB(19), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_18, carry_out => CO_19, saida => output_ALU(19));

	unidade_bit_ULA18 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(18), entradaB => inputB(18), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_17, carry_out => CO_18, saida => output_ALU(18));

	unidade_bit_ULA17 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(17), entradaB => inputB(17), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_16, carry_out => CO_17, saida => output_ALU(17));

	unidade_bit_ULA16 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(16), entradaB => inputB(16), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_15, carry_out => CO_16, saida => output_ALU(16));

	unidade_bit_ULA15 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(15), entradaB => inputB(15), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_14, carry_out => CO_15, saida => output_ALU(15));

	unidade_bit_ULA14 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(14), entradaB => inputB(14), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_13, carry_out => CO_14, saida => output_ALU(14));

	unidade_bit_ULA13 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(13), entradaB => inputB(13), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_12, carry_out => CO_13, saida => output_ALU(13));

	unidade_bit_ULA12 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(12), entradaB => inputB(12), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_11, carry_out => CO_12, saida => output_ALU(12));

	unidade_bit_ULA11 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(11), entradaB => inputB(11), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_10, carry_out => CO_11, saida => output_ALU(11));

	unidade_bit_ULA10 : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(10), entradaB => inputB(10), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_9, carry_out => CO_10, saida => output_ALU(10));

	unidade_bit_ULA9  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(9), entradaB => inputB(9), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_8, carry_out => CO_9, saida => output_ALU(9));

	unidade_bit_ULA8  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(8), entradaB => inputB(8), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_7, carry_out => CO_8, saida => output_ALU(8));

	unidade_bit_ULA7  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(7), entradaB => inputB(7), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_6, carry_out => CO_7, saida => output_ALU(7));

	unidade_bit_ULA6  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(6), entradaB => inputB(6), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_5, carry_out => CO_6, saida => output_ALU(6));

	unidade_bit_ULA5  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(5), entradaB => inputB(5), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_4, carry_out => CO_5, saida => output_ALU(5));

	unidade_bit_ULA4  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(4), entradaB => inputB(4), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_3, carry_out => CO_4, saida => output_ALU(4));

	unidade_bit_ULA3  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(3), entradaB => inputB(3), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_2, carry_out => CO_3, saida => output_ALU(3));

	unidade_bit_ULA2  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(2), entradaB => inputB(2), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_1, carry_out => CO_2, saida => output_ALU(2));

	unidade_bit_ULA1  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(1), entradaB => inputB(1), slt => '0', inverteB => inverteB, selMUX => selectMUX, carry_in => CO_0, carry_out => CO_1, saida => output_ALU(1));

	unidade_bit_ULA0  : entity work.unidade_bit_ULA 
	port map (entradaA => inputA(0), entradaB => inputB(0), slt => overflow_out_31, inverteB => inverteB, selMUX => selectMUX, carry_in => inverteB, carry_out => CO_0, saida => output_ALU(0));

	
	
	Z <= '1' when not (output_ALU(31) or output_ALU(30) or output_ALU(29) or output_ALU(28) or output_ALU(27) or output_ALU(26) or output_ALU(25) or output_ALU(24) or 
							output_ALU(23) or output_ALU(22) or output_ALU(21) or output_ALU(20) or output_ALU(19) or output_ALU(18) or output_ALU(17) or output_ALU(16) or 
							output_ALU(15) or output_ALU(14) or output_ALU(13) or output_ALU(12) or output_ALU(11) or output_ALU(10) or output_ALU (9) or output_ALU(8) or 
							output_ALU(7) or output_ALU(6) or output_ALU(5) or output_ALU(4) or output_ALU(3) or output_ALU(2) or output_ALU(1) or output_ALU(0)) 
					else '0';
end architecture;
