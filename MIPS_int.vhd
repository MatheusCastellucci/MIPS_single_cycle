library ieee;
use ieee.std_logic_1164.all;

entity MIPS_int is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 32;
        larguraEnderecos : natural := 32;
         simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
	 CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 LEDR  : out std_logic_vector(7 downto 0);
	 HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0)
  );
end entity;


architecture arquitetura of MIPS_int is
	signal CLK: std_logic;
	
	signal mux_proxpc_out: std_logic_vector((larguraEnderecos-1) downto 0);
	signal pc_out        : std_logic_vector((larguraEnderecos-1) downto 0);
	signal inc_pc_out    : std_logic_vector((larguraEnderecos-1) downto 0);
	
	signal Instrucao: std_logic_vector((larguraDados-1) downto 0);
	
	-- Parte de Instrução R/I/J
		alias opcode   : std_logic_vector(5  downto 0) is Instrucao(31 downto 26);
		alias rs		   : std_logic_vector(4  downto 0) is Instrucao(25 downto 21);
		alias rt	      : std_logic_vector(4  downto 0) is Instrucao(20 downto 16);
		alias rd       : std_logic_vector(4  downto 0) is Instrucao(15 downto 11);
		alias shamt    : std_logic_vector(4  downto 0) is Instrucao(10 downto 6);
		alias funct    : std_logic_vector(5  downto 0) is Instrucao(5 downto 0);
		alias immediate: std_logic_vector(15 downto 0) is Instrucao(15 downto 0);
		alias address  : std_logic_vector(25 downto 0) is Instrucao(25 downto 0);
		
	signal mux_rt_rd_out : std_logic_vector(4 downto 0);	
	
	signal dado_lido_reg1: std_logic_vector((larguraDados-1) downto 0);
	signal dado_lido_reg2: std_logic_vector((larguraDados-1) downto 0);
	
	signal extSinal_out: std_logic_vector((larguraDados-1) downto 0);
	
	signal mux_rt_imd_out: std_logic_vector ((larguraDados-1) downto 0);
	signal ULA_ctrl: std_logic_vector(2 downto 0);
	
	signal ULA_out: std_logic_vector((larguraDados-1) downto 0);
	signal flagZero_ULA: std_logic;
	
	signal sinal_ext_shift: std_logic_vector ((larguraEnderecos-1) downto 0);
	signal mux_beq_pc_out: std_logic_vector ((larguraDados-1) downto 0);
	
	signal RAM_out:  std_logic_vector ((larguraDados-1) downto 0);
	signal mux_ULA_mem_out: std_logic_vector ((larguraDados-1) downto 0);
	
	
	
	signal Sinais_controle: std_logic_vector (8 downto 0);
	signal mux_FPGA_out: std_logic_vector ((larguraDados-1) downto 0);
	
	-- Displays 7seg
	signal dis0: std_logic_vector(6 downto 0);
	signal dis1: std_logic_vector(6 downto 0);
	signal dis2: std_logic_vector(6 downto 0);
	signal dis3: std_logic_vector(6 downto 0);
	signal dis4: std_logic_vector(6 downto 0);
	signal dis5: std_logic_vector(6 downto 0);

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
				  

PC: entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
	  port map (DIN => mux_proxpc_out, 
				   DOUT => pc_out, 
				   ENABLE => '1', 
				   CLK => CLK, 
				   RST => '0');
					
incrementaPC: entity work.somaConstante  generic map (larguraDados => larguraDados, constante => 4)
					port map(entrada => pc_out, 
								saida => inc_pc_out);

Memoria_Instrucao: entity work.ROMMIPS   generic map (dataWidth => larguraDados, addrWidth => larguraEnderecos)
						 port map (Endereco => pc_out, 
									  Dado => Instrucao);
									  
									  
									  	  
Mux_ProxPC:  entity work.muxGenerico2x1 generic map (larguraDados => larguraDados)
        port map(entradaA_MUX => mux_beq_pc_out,
                 entradaB_MUX => inc_pc_out(31 downto 28) & address & "00",
                 seletor_MUX => Sinais_controle(8),
                 saida_MUX => mux_proxpc_out);									  
									  
  
Mux_Rt_Rd:  entity work.muxGenerico2x1 generic map (larguraDados => 5)
        port map(entradaA_MUX => rt,
                 entradaB_MUX =>  rd,
                 seletor_MUX => Sinais_controle(7),
                 saida_MUX => mux_rt_rd_out);
					  
	
Banco_Registradores: entity work.bancoReg generic map(larguraDados => larguraDados,larguraEndBancoRegs => 5)
		 port map(clk => CLK,
		    		 enderecoA => rs,
					 enderecoB => rt,
                enderecoC => mux_rt_rd_out,
                dadoEscritaC=> mux_ULA_mem_out,
					 
					 escreveC => Sinais_controle(6),
					 saidaA => dado_lido_reg1,
					 saidaB => dado_lido_reg2);

					 
Estende_Sinal: entity work.estendeSinalGenerico   generic map (larguraDadoEntrada => 16, larguraDadoSaida => larguraDados)
					  port map (estendeSinal_IN => immediate, 
								   estendeSinal_OUT =>  extSinal_out);
									
									

Mux_Rt_Imediato:  entity work.muxGenerico2x1 generic map (larguraDados => larguraDados)
        port map(entradaA_MUX => dado_lido_reg2,
                 entradaB_MUX =>  extSinal_out,
                 seletor_MUX => Sinais_controle(5),
                 saida_MUX => mux_rt_imd_out);
	

Unidade_Controle_ULA: entity work.uniContULA 
			port map(opcode => opcode,
						funct => funct,
						r => Sinais_controle(7),
						saida => ULA_ctrl);	
				
		
ULA_MIPS: entity work.ULA
       port map (invB => ULA_ctrl(2), 
					  A => dado_lido_reg1,
					  B => mux_rt_imd_out,
					  seletor => ULA_ctrl(1 downto 0), 
					  resultado => ULA_out,  
					  Z => flagZero_ULA);

					  
Incrementa_shiftado : entity work.somador  generic map (larguraDados => larguraEnderecos)
		 port map(entradaA => inc_pc_out,
					 entradaB => extSinal_out(29 downto 0) & "00",
					 saida => sinal_ext_shift);
					 
					 
Mux_beq_pc:  entity work.muxGenerico2x1 generic map (larguraDados => larguraEnderecos)
				  port map(entradaA_MUX => inc_pc_out,
							  entradaB_MUX =>  sinal_ext_shift,
							  seletor_MUX => Sinais_controle(2) and flagZero_ULA,
							  saida_MUX => mux_beq_pc_out);

							
RAM : entity work.RAMMIPS generic map (dataWidth => larguraDados, addrWidth => larguraEnderecos)
      port map (Endereco => ULA_out, 
				    we => Sinais_controle(0), 
					 re => Sinais_controle(1), 
					 Dado_in => dado_lido_reg2, 
					 dado_out => RAM_out, 
					 clk => CLK);
			 
					 
Mux_ULA_mem :  entity work.muxGenerico2x1 generic map (larguraDados => larguraDados)
					  port map(entradaA_MUX => ULA_out,
								  entradaB_MUX =>  RAM_out,
								  seletor_MUX => Sinais_controle(3),
								  saida_MUX => mux_ULA_mem_out);

								  
--\\\\\\\\\\\\\\\\\\\PARTE PARA FAZER OS DISPLAYS////////////////////--						  

Mux_FPGA :  entity work.muxGenerico2x1 generic map (larguraDados => 32)
        port map(entradaA_MUX => pc_out,
                 entradaB_MUX =>  ULA_out,
                 seletor_MUX => not KEY(1),
                 saida_MUX => mux_FPGA_out);
	
	
display0 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_FPGA_out(3 downto 0),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis0);
					  
display1 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_FPGA_out(7 downto 4),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis1);
				
display2 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_FPGA_out(11 downto 8),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis2);
				
display3 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_FPGA_out(15 downto 12),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis3);
				
display4 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_FPGA_out(19 downto 16),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis4);
				
display5 :  entity work.conversorHex7Seg
        port map(dadoHex => mux_FPGA_out(23 downto 20),
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => dis5);

					  
Sinais_controle(8) <= '1' when Instrucao(31 downto 26) = "000010" else '0';
Sinais_controle(7) <= '1' when Instrucao(31 downto 26) = "000000" else '0';					
Sinais_controle(6) <= '1' when Instrucao(31 downto 26) = "000000" or Instrucao(31 downto 26) = "100011" else '0';
Sinais_controle(5) <= '1' when Instrucao(31 downto 26) = "100011" or Instrucao(31 downto 26) = "101011" else '0';
Sinais_controle(4) <= '1' when Instrucao(5 downto 0)   = "100000" or Instrucao(31 downto 26) = "100011" or Instrucao(31 downto 26) = "101011" else '0';
Sinais_controle(3) <= '1' when Instrucao(31 downto 26) = "100011" else '0'; 
Sinais_controle(2) <= '1' when Instrucao(31 downto 26) = "000100" else '0';
Sinais_controle(1) <= '1' when Instrucao(31 downto 26) = "100011" else '0';
Sinais_controle(0) <= '1' when Instrucao(31 downto 26) = "101011" else '0';


LEDR(3 downto 0) <= mux_FPGA_out(27 downto 24);
LEDR(7 downto 4) <= mux_FPGA_out(31 downto 28);

HEX0 <= dis0;
HEX1 <= dis1;
HEX2 <= dis2;
HEX3 <= dis3;
HEX4 <= dis4;
HEX5 <= dis5;
				
end architecture;