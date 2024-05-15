library ieee;
use ieee.std_logic_1164.all;

entity decoder_opcode is
  port ( opcode: in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of decoder_opcode is

  begin
saida <= "010" when opcode = "10" & "1011" else -- Store Word
         "010" when opcode = "10" & "0011" else -- Load Word
         "110" when opcode = "00" & "0100" else -- Branch on Equal (beq)
         "000";  -- NOP para os entradas Indefinidas
end architecture;