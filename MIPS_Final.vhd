library ieee;
use ieee.std_logic_1164.all;

entity MIPS_Final is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8;
        larguraEnderecos : natural := 9;
         simulacao : boolean := FALSE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
	 CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 SW: in std_logic_vector(9 downto 0);
	 LEDR  : out std_logic_vector(7 downto 0);
	 HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0)
  );
end entity;


architecture arquitetura of MIPS_Final is

-- Faltam alguns sinais:
	signal CLK: std_logic;
	signal inc_pc: std_logic_vector(31 downto 0);
	signal pc_rom: std_logic_vector(31 downto 0);
	signal rom_regs: std_logic_vector(31 downto 0);
	signal dado1: std_logic_vector(31 downto 0);
	signal dado2: std_logic_vector(31 downto 0);
	signal saidaUla: std_logic_vector(31 downto 0);
	signal Sinais_controle: std_logic_vector (13 downto 0);
	signal mux_banco: std_logic_vector(4 downto 0);
	signal saida_extSignal: std_logic_vector(31 downto 0);
	signal mux_ULA: std_logic_vector (31 downto 0);
	signal saida_RAM: std_logic_vector (31 downto 0);
	signal saida_Mux3: std_logic_vector (31 downto 0);
	signal saida_Inc2: std_logic_vector (31 downto 0);
	signal saida_Mux4: std_logic_vector (31 downto 0);
	signal saida_Mux5: std_logic_vector (31 downto 0);
	signal Z_ula: std_logic;
	signal saida_UC_ULA: std_logic_vector(2 downto 0);
	signal saida_MuxFPGA: std_logic_vector (31 downto 0);
	signal dis0: std_logic_vector(6 downto 0);
	signal dis1: std_logic_vector(6 downto 0);
	signal dis2: std_logic_vector(6 downto 0);
	signal dis3: std_logic_vector(6 downto 0);
	signal dis4: std_logic_vector(6 downto 0);
	signal dis5: std_logic_vector(6 downto 0);
	signal saida_lui: std_logic_vector(31 downto 0);
	signal saida_MuxJr: std_logic_vector(31 downto 0);

begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector

gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;
-- Falta acertar o conteudo da ROM (no arquivo memoriaROM.vhd)

			 
										  

PC : entity work.registradorGenerico   generic map (larguraDados => 32)
	  port map (DIN => saida_MuxJr, 
				   DOUT => pc_rom, 
				   ENABLE => '1', 
				   CLK => CLK, 
				   RST => '0');

incrementaPC : entity work.somaConstante  generic map (larguraDados => 32, constante => 4)
					port map(entrada => pc_rom, 
								saida => inc_pc);

ROM1 : entity work.ROMMIPS   generic map (dataWidth => 32, addrWidth => 32)
       port map (Endereco => pc_rom, 
					  Dado => rom_regs);
		  
Mux1 :  entity work.muxGenerico4x1 generic map (larguraDados => 5)
        port map(entrada0_MUX => rom_regs(20 downto 16),
                 entrada1_MUX =>  rom_regs(15 downto 11),
					  entrada2_MUX =>  "11111",
					  entrada3_MUX =>  "00000",
                 seletor_MUX => Sinais_controle(11 downto 10),
                 saida_MUX => mux_banco);
					  
ext : entity work.estendeSinalGenerico   generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
					  port map (estendeSinal_IN => rom_regs(15 downto 0),
									sel => Sinais_controle(9),
								   estendeSinal_OUT =>  saida_extSignal);
									
inc2 : entity work.somador  generic map (larguraDados => 32)
		 port map(entradaA => inc_pc,
					 entradaB => saida_extSignal(29 downto 0) & "00",
					 saida => saida_Inc2);
					 
Mux4 :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map(entradaA_MUX => inc_pc,
                 entradaB_MUX =>  saida_Inc2,
                 seletor_MUX => (Sinais_controle(3) and Z_ula) or (Sinais_controle(2) and not Z_ula),
                 saida_MUX => saida_Mux4);
			 
banco: entity work.bancoReg generic map(larguraDados => 32,larguraEndBancoRegs => 5)
		 port map(clk => CLK,
		    		 enderecoA => rom_regs(25 downto 21),
					 enderecoB => rom_regs(20 downto 16),
                enderecoC => mux_banco,
                dadoEscritaC=> saida_Mux3,
					 escreveC => Sinais_controle(8),
					 saidaA => dado1,
					 saidaB => dado2);
					 
Mux2 :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map(entradaA_MUX => dado2,
                 entradaB_MUX =>  saida_extSignal,
                 seletor_MUX => Sinais_controle(7),
                 saida_MUX => mux_ULA);
					 
ULA1 : entity work.ULA
       port map (invB => saida_UC_ULA(2), 
					  A => dado1,
					  B => mux_ULA,
					  sel4x1 => saida_UC_ULA(1 downto 0), 
					  resultado => saidaUla,  
					  Z => Z_ula);

							
RAM : entity work.memoriaRAM   generic map (dataWidth => 32, addrWidth => 32)
      port map (Endereco => saidaUla, 
				    we => Sinais_controle(0), 
					 re => Sinais_controle(1), 
					 Dado_in => dado2, 
					 dado_out => saida_RAM, 
					 clk => CLK);

Mux3 :  entity work.muxGenerico4x1 generic map (larguraDados => 32)
        port map(entrada0_MUX => saidaUla,
                 entrada1_MUX =>  saida_RAM,
					  entrada2_MUX =>  inc_pc,
					  entrada3_MUX =>  saida_lui,
                 seletor_MUX => Sinais_controle(5 downto 4),
                 saida_MUX => saida_Mux3);

Mux5 :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map(entradaA_MUX => saida_Mux4,
                 entradaB_MUX => inc_pc(31 downto 28) & rom_regs(25 downto 0) & "00",
                 seletor_MUX => Sinais_controle(12),
                 saida_MUX => saida_Mux5);
					  
Mux_JR :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map(entradaA_MUX => saida_Mux5,
                   entradaB_MUX => dado1,
                   seletor_MUX => Sinais_controle(13),
                   saida_MUX => saida_MuxJr);
					  
UC_ULA: entity work.uniContULA port map(
		opcode => rom_regs(31 downto 26),
		funct => rom_regs(5 downto 0),
		r => Sinais_controle(6),
		saida => saida_UC_ULA
	);
	
MuxF_PGA :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map(entradaA_MUX => pc_rom,
                 entradaB_MUX =>  saidaUla,
                 seletor_MUX => SW(0),
                 saida_MUX => saida_MuxFPGA);
	
display0 :  entity work.conversorHex7Seg
        port map(dadoHex => saida_MuxFPGA(3 downto 0),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis0);
					  
display1 :  entity work.conversorHex7Seg
        port map(dadoHex => saida_MuxFPGA(7 downto 4),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis1);
				
display2 :  entity work.conversorHex7Seg
        port map(dadoHex => saida_MuxFPGA(11 downto 8),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis2);
				
display3 :  entity work.conversorHex7Seg
        port map(dadoHex => saida_MuxFPGA(15 downto 12),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis3);
				
display4 :  entity work.conversorHex7Seg
        port map(dadoHex => saida_MuxFPGA(19 downto 16),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis4);
				
display5 :  entity work.conversorHex7Seg
        port map(dadoHex => saida_MuxFPGA(23 downto 20),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis5);
					  
LU_I: entity work.LUI port map(LUI_IN => rom_regs(15 downto 0), LUI_OUT => saida_lui);

sinais_controle(13) <= '1' when rom_regs(31 downto 26) = "000000" and rom_regs(5 downto 0) = "001000" else '0'; 
					  
Sinais_controle(12) <= '1' when (rom_regs(31 downto 26) = "000010" or rom_regs(31 downto 26) = "000011") else '0';

Sinais_controle(11 downto 10) <= "01" when rom_regs(31 downto 26) = "000000" else "10" when rom_regs(31 downto 26) = "000011" else "00";	

Sinais_controle(9) <= '1' when (rom_regs(31 downto 26) = "001101" or rom_regs(31 downto 26) = "001100") else '0';
				
Sinais_controle(8) <= '1' when ((rom_regs(31 downto 26) = "000000" and not(rom_regs(5 downto 0) = "001000")) or rom_regs(31 downto 26) = "100011" or rom_regs(31 downto 26) = "001000" or rom_regs(31 downto 26) = "000011" or rom_regs(31 downto 26) = "001100" or rom_regs(31 downto 26) = "001101" or rom_regs(31 downto 26) = "001111" or rom_regs(31 downto 26) = "001010") else '0';

Sinais_controle(7) <= '1' when rom_regs(31 downto 26) = "100011" else '1' when rom_regs(31 downto 26) = "101011" else '1' when rom_regs(31 downto 26) = "001000" else '1' when rom_regs(31 downto 26) = "001100" else '1' when rom_regs(31 downto 26) = "001101" else '1' when rom_regs(31 downto 26) = "001010" else '0';

Sinais_controle(6) <= '1' when rom_regs(31 downto 26) = "000000" else '0';

Sinais_controle(5 downto 4) <= "01" when rom_regs(31 downto 26) = "100011" else "11" when rom_regs(31 downto 26) = "001111" else "10" when rom_regs(31 downto 26) = "000011" else "00"; 

Sinais_controle(3) <= '1' when rom_regs(31 downto 26) = "000100" else '0';

Sinais_controle(2) <= '1' when rom_regs(31 downto 26) = "000101" else '0';

Sinais_controle(1) <= '1' when rom_regs(31 downto 26) = "100011" else '0';

Sinais_controle(0) <= '1' when rom_regs(31 downto 26) = "101011" else '0';


LEDR(3 downto 0) <= saida_MuxFPGA(27 downto 24);
LEDR(7 downto 4) <= saida_MuxFPGA(31 downto 28);

HEX0 <= dis0;
HEX1 <= dis1;
HEX2 <= dis2;
HEX3 <= dis3;
HEX4 <= dis4;
HEX5 <= dis5;
				
end architecture;