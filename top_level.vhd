library ieee;
use ieee.std_logic_1164.all;

entity top_level is
 -- Total de bits das entradas e saidas
	generic (
		larguraDados : natural := 8;
		larguraEnderecos : natural := 9;
		simulacao : boolean := FALSE -- para gravar na placa, altere de TRUE para FALSE
		);
		
	port (
		CLOCK_50 : in std_logic;
		KEY: in std_logic_vector(3 downto 0);
		LEDR  : out std_logic_vector(9 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0)
		);
		
end entity;


architecture arquitetura of top_level is
	signal CLK: std_logic;
	
	signal inc_pc: std_logic_vector(31 downto 0);
	signal pc_rom: std_logic_vector(31 downto 0);
	signal instrucao: std_logic_vector(31 downto 0);
	signal dado1: std_logic_vector(31 downto 0);
	signal dado2: std_logic_vector(31 downto 0);
	signal saidaUla: std_logic_vector(31 downto 0);
	signal mux_banco: std_logic_vector(4 downto 0);
	signal mux_ULA: std_logic_vector (31 downto 0);
	signal saida_extSignal: std_logic_vector(31 downto 0);
	signal saida_RAM: std_logic_vector (31 downto 0);
	signal saida_mux_ULA_mem: std_logic_vector (31 downto 0);
	signal saida_inc: std_logic_vector (31 downto 0);
	signal saida_mux_beq_pc: std_logic_vector (31 downto 0);
	signal saida_mux_proxpc: std_logic_vector (31 downto 0);
	signal Z_ula: std_logic;
	signal saida_ULA_CTRL: std_logic_vector(2 downto 0);
	signal saida_MuxFPGA: std_logic_vector (31 downto 0);
	signal saida_lui: std_logic_vector(31 downto 0);
	signal saida_MuxJr: std_logic_vector(31 downto 0);
	
	-- Displays Hex
	signal dis0: std_logic_vector(6 downto 0);
	signal dis1: std_logic_vector(6 downto 0);
	signal dis2: std_logic_vector(6 downto 0);
	signal dis3: std_logic_vector(6 downto 0);
	signal dis4: std_logic_vector(6 downto 0);
	signal dis5: std_logic_vector(6 downto 0);
	
	-- Sinais de Controle
	signal JR:  std_logic;
	signal seletor_mux_beq_jmp: std_logic;
	signal seletor_mux_banco: std_logic_vector(1 downto 0);
	signal escreve_banco: std_logic;
	signal seletor_mux_rt_imediato: std_logic;
	signal seletor_R: std_logic;
	signal seletor_mux_ULA_mem: std_logic_vector(1 downto 0);
	signal BNE: std_logic;
	signal BEQ: std_logic;
	signal re: std_logic;
	signal we: std_logic;
	

begin

gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
	port map (
		clk => CLOCK_50,
		entrada => (not KEY(0)),
		saida => CLK
		);
end generate;								  

PC : entity work.registradorGenerico   generic map (larguraDados => 32)
	port map (
		DIN => saida_MuxJr, 
		DOUT => pc_rom, 
		ENABLE => '1', 
		CLK => CLK, 
		RST => '0'
		);

incrementaPC : entity work.somaConstante  generic map (larguraDados => 32, constante => 4)
	port map (	
		entrada => pc_rom, 
		saida => inc_pc
      );

ROM : entity work.ROMMIPS   generic map (dataWidth => 32, addrWidth => 32)
	port map (
		Endereco => pc_rom, 
		Dado => instrucao
		);

Mux_BancoReg :  entity work.muxGenerico4x1 generic map (larguraDados => 5)
	port map (
		entrada0_MUX => instrucao(20 downto 16),
		entrada1_MUX =>  instrucao(15 downto 11),
		entrada2_MUX =>  "11111",
		entrada3_MUX =>  "00000",
		seletor_MUX => seletor_mux_banco,
		saida_MUX => mux_banco
		);
				  
estende_sinal : entity work.estendeSinalGenerico   generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
	port map (
      entrada => instrucao(15 downto 0),
		saida =>  saida_extSignal
      );
									
inc : entity work.somador  generic map (larguraDados => 32)
	port map (
      entradaA => inc_pc,
		entradaB => saida_extSignal(29 downto 0) & "00",
		saida => saida_inc
		);
					 
Mux_beq_pc :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
	port map (
		entradaA_MUX => inc_pc,
		entradaB_MUX =>  saida_inc,
		seletor_MUX => (BEQ and Z_ula) or (BNE and not Z_ula),
		saida_MUX => saida_mux_beq_pc
		);
		 
banco: entity work.bancoReg generic map(larguraDados => 32,larguraEndBancoRegs => 5)
	port map (
		clk => CLK,
		enderecoA => instrucao(25 downto 21),
		enderecoB => instrucao(20 downto 16),
		enderecoC => mux_banco,
		dadoEscritaC=> saida_mux_ULA_mem,
		escreveC => escreve_banco,
		saidaA => dado1,
		saidaB => dado2
		);
					 
Mux_Rt_imediato :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
	port map (
		entradaA_MUX => dado2,
		entradaB_MUX =>  saida_extSignal,
		seletor_MUX => seletor_mux_rt_imediato,
		saida_MUX => mux_ULA
		);
		 
ULA : entity work.ULA
	port map (
		invB => saida_ULA_CTRL(2), 
		A => dado1,
		B => mux_ULA,
		seletor => saida_ULA_CTRL(1 downto 0), 
		resultado => saidaUla,  
		Z => Z_ula
		);

						
RAM : entity work.memoriaRAM   generic map (dataWidth => 32, addrWidth => 32)
	port map (
		Endereco => saidaUla, 
		we => we, 
		re => re, 
		Dado_in => dado2, 
		dado_out => saida_RAM, 
		clk => CLK
		);

Mux_ULA_mem :  entity work.muxGenerico4x1 generic map (larguraDados => 32)
	port map (
		entrada0_MUX => saidaUla,
		entrada1_MUX =>  saida_RAM,
		entrada2_MUX =>  inc_pc,
		entrada3_MUX =>  saida_lui,
		seletor_MUX => seletor_mux_ULA_mem,
		saida_MUX => saida_mux_ULA_mem
		);

Mux_ProxPC :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
	port map (
		entradaA_MUX => saida_mux_beq_pc,
		entradaB_MUX => inc_pc(31 downto 28) & instrucao(25 downto 0) & "00",
		seletor_MUX => seletor_mux_beq_jmp,
		saida_MUX => saida_mux_proxpc
		);
			  
Mux_JR :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
	port map (
		entradaA_MUX => saida_mux_proxpc,
		entradaB_MUX => dado1,
		seletor_MUX => JR,
		saida_MUX => saida_MuxJr
		);
			  
ULA_CTRL: entity work.ULA_CTRL
	port map (
		opcode => instrucao(31 downto 26),
		funct => instrucao(5 downto 0),
		R => seletor_R,
		saida => saida_ULA_CTRL
		);

MuxFPGA :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
	port map (
		entradaA_MUX => pc_rom,
		entradaB_MUX =>  saidaUla,
		seletor_MUX => not KEY(1),
		saida_MUX => saida_MuxFPGA
		);
					 
displays: entity work.displays
	port map (
		entrada => saida_MuxFPGA(23 downto 0),
		apaga => '0',
		negativo => '0',
		overFlow => '0',
		saida7seg0 => dis0,
		saida7seg1 => dis1,
		saida7seg2 => dis2,
		saida7seg3 => dis3,
		saida7seg4 => dis4,
		saida7seg5 => dis5
		);
					  
LUI: entity work.LUI
	port map (
		entrada => instrucao(15 downto 0),
		saida => saida_lui
		);

JR <= '1' when instrucao(31 downto 26) = "000000" and instrucao(5 downto 0) = "001000" else '0'; 
					  
seletor_mux_beq_jmp <= '1' when (instrucao(31 downto 26) = "000010" or instrucao(31 downto 26) = "000011") else '0';

seletor_mux_banco <= "01" when instrucao(31 downto 26) = "000000" else "10" when instrucao(31 downto 26) = "000011" else "00";	
				
escreve_banco <= '1' when ((instrucao(31 downto 26) = "000000" and not(instrucao(5 downto 0) = "001000")) or instrucao(31 downto 26) = "100011" or instrucao(31 downto 26) = "001000" or instrucao(31 downto 26) = "000011" or instrucao(31 downto 26) = "001100" or instrucao(31 downto 26) = "001101" or instrucao(31 downto 26) = "001111" or instrucao(31 downto 26) = "001010") else '0';

seletor_mux_rt_imediato <= '1' when instrucao(31 downto 26) = "100011" else '1' when instrucao(31 downto 26) = "101011" else '1' when instrucao(31 downto 26) = "001000" else '1' when instrucao(31 downto 26) = "001100" else '1' when instrucao(31 downto 26) = "001101" else '1' when instrucao(31 downto 26) = "001010" else '0';

seletor_R <= '1' when instrucao(31 downto 26) = "000000" else '0';

seletor_mux_ULA_mem <= "01" when instrucao(31 downto 26) = "100011" else "11" when instrucao(31 downto 26) = "001111" else "10" when instrucao(31 downto 26) = "000011" else "00"; 

BEQ <= '1' when instrucao(31 downto 26) = "000100" else '0';

BNE <= '1' when instrucao(31 downto 26) = "000101" else '0';

re <= '1' when instrucao(31 downto 26) = "100011" else '0';

we <= '1' when instrucao(31 downto 26) = "101011" else '0';

LEDR(9 downto 8) <= "00";

LEDR(3 downto 0) <= saida_MuxFPGA(27 downto 24);
LEDR(7 downto 4) <= saida_MuxFPGA(31 downto 28);

HEX0 <= dis0;
HEX1 <= dis1;
HEX2 <= dis2;
HEX3 <= dis3;
HEX4 <= dis4;
HEX5 <= dis5;
				
end architecture;