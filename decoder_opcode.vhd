library ieee;
use ieee.std_logic_1164.all;

entity decoder_opcode is
  port ( 
			opcode : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of decoder_opcode is

  begin
saida <= "010" when opcode = "101011" else -- sw
			"010" when opcode = "001000" else -- addi
         "010" when opcode = "100011" else -- lw
         "110" when opcode = "000100" else -- beq
			"110" when opcode = "000101" else -- bne
			"001" when opcode = "001101" else -- ori
			"111" when opcode = "001010" else -- slti
         "000" when opcode = "001100" else -- andi
			"000";
end architecture;