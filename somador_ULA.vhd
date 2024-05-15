library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity somador_ULA is
    port
    (
		C_in			: in 	std_logic;
		A 	         : in	std_logic;
		B 	         : in 	std_logic;
		soma		   : out 	std_logic;
		C_out		   : out 	std_logic
    );
end entity;

architecture comportamento of somador_ULA is
begin

soma <= C_in xor (A xor B);
C_out <= (A and B) or (C_in and (A xor B));

end architecture;