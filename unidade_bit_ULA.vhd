library ieee;
use ieee.std_logic_1164.all;

entity unidade_bit_ULA is
  port (
    entradaA, entradaB, slt, inverteB, carry_in : in std_logic;
	 selMUX : in std_logic_vector(1 downto 0);
    carry_out, saida : out std_logic
  );
end entity;

architecture comportamento of unidade_bit_ULA is

    signal mux_not_out : std_logic;
    signal adder_out : std_logic;

  begin
    MUX_NOT : entity work.mux2x1 
				port map (entradaA_MUX => entradaB, entradaB_MUX => (not entradaB), seletor_MUX => inverteB, saida_MUX => mux_not_out);

    ADDER   : entity work.genericAdder 
				port map (entradaA => entradaA, entradaB => mux_not_out, carry_in => carry_in, carry_out => carry_out, saida => adder_out);

    MUX_OUT : entity work.mux4x1 
				port map (entradaA_MUX => (entradaA and mux_not_out), entradaB_MUX => (entradaA or mux_not_out), entradaC_MUX => adder_out, entradaD_MUX => slt, seletor_MUX => selMUX, saida_MUX => saida);

end architecture;
