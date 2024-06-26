library ieee;
use ieee.std_logic_1164.all;

entity ULA_CTRL is
	port (
		opcode : in std_logic_vector (5 downto 0);
		funct : in std_logic_vector (5 downto 0);
		R : in std_logic;
		saida : out std_logic_vector (2 downto 0)
	);
end entity;

architecture comportamento of ULA_CTRL is
	signal saida_opcode: std_logic_vector (2 downto 0);
	signal saida_funct: std_logic_vector (2 downto 0);

begin
	DECODER_OPCODE: entity work.decoder_opcode
		port map (opcode => opcode, saida => saida_opcode);
		
	DECODER_FUNCT: entity work.decoder_funct
		port map (funct => funct, saida => saida_funct);

	MUX: entity work.muxGenerico2x1  generic map (larguraDados => 3)
		port map (entradaA_MUX => saida_opcode,
				  entradaB_MUX => saida_funct,
				  seletor_MUX => R,
				  saida_MUX => saida);

end architecture;