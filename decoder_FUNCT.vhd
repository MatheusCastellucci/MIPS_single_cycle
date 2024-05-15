library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  --Soma (esta biblioteca =ieee)

entity decoder_FUNCT is
  port ( funct: in std_logic_vector(5 downto 0);
         saida: out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of decoder_FUNCT is

  begin
saida <= "000" when funct = "10" & "0100" else -- And
         "001" when funct = "10" & "0101" else -- Or
         "010" when funct = "10" & "0000" else -- Add
			"110" when funct = "10" & "0010" else -- Subtract
			"111" when funct = "10" & "1010" else -- Set Less than
         "000";  -- NOP para os entradas Indefinidas
end architecture;