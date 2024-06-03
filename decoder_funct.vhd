library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_funct is
  port ( funct : in std_logic_vector(5 downto 0);
         saida : out std_logic_vector(2 downto 0)
  );
end entity;

architecture comportamento of decoder_funct is

  begin
saida <= "000" when funct = "100100" else -- and
         "001" when funct = "100101" else -- or
         "010" when funct = "100000" else -- add
			   "110" when funct = "100010" else -- sub
			   "111" when funct = "101010" else -- slt
         "000";
end architecture;