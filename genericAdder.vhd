library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;          -- IEEE library for arithmetic functions

entity genericAdder is
    port
    (
        entradaA, entradaB, carry_in : in std_logic;
        carry_out, saida : out std_logic
    );
end entity;

architecture comportamento of genericAdder is
    signal xor1_out: std_logic;
    begin	
		  XOR1: entity work.gateXOR 
				port map (A => entradaA, B => entradaB, output => xor1_out);
			
		  XOR2: entity work.gateXOR 
				port map (A => carry_in, B => xor1_out, output => saida);

		  carry_out <= ((entradaA and entradaB) or (xor1_out and carry_in));			
end architecture;