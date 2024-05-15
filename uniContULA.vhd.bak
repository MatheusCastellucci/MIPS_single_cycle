library ieee;
use ieee.std_logic_1164.all;

entity uniContULA is
	
	port (
		opcode : in std_logic_vector (5 downto 0);
		funct : in std_logic_vector (5 downto 0);
		r : in std_logic;
		saida : out std_logic_vector (2 downto 0)
	);
end entity;

architecture comportamento of uniContULA is
	signal saida_op: std_logic_vector (2 downto 0);
	signal saida_funct: std_logic_vector (2 downto 0);

begin
	D_OPCODE :	entity work.decoder_Ctrl
		port map (opcode => opcode, saida => saida_op);
		
	D_FUNCT  :	entity work.decoder_Ctrl1
		port map (funct => funct, saida => saida_funct);

	MUX : entity work.muxGenerico2x1  generic map (larguraDados => 3)
		port map (entradaA_MUX => saida_op, entradaB_MUX => saida_funct, seletor_MUX => r,
						saida_MUX => saida);

end architecture;