library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULA is
    port
    (
		invB		   : in 	std_logic;
		A 	         : in	std_logic_vector(31 downto 0);
		B 	         : in 	std_logic_vector(31 downto 0);
		sel4x1		: in 	std_logic_vector(1 downto 0);
		resultado   : out std_logic_vector(31 downto 0);
		Z           : out std_logic
    );
end entity;

architecture comportamento of ULA is

signal C_out0: std_logic;
signal C_out1: std_logic;
signal C_out2: std_logic;
signal C_out3: std_logic;
signal C_out4: std_logic;
signal C_out5: std_logic;
signal C_out6: std_logic;
signal C_out7: std_logic;
signal C_out8: std_logic;
signal C_out9: std_logic;
signal C_out10: std_logic;
signal C_out11: std_logic;
signal C_out12: std_logic;
signal C_out13: std_logic;
signal C_out14: std_logic;
signal C_out15: std_logic;
signal C_out16: std_logic;
signal C_out17: std_logic;
signal C_out18: std_logic;
signal C_out19: std_logic;
signal C_out20: std_logic;
signal C_out21: std_logic;
signal C_out22: std_logic;
signal C_out23: std_logic;
signal C_out24: std_logic;
signal C_out25: std_logic;
signal C_out26: std_logic;
signal C_out27: std_logic;
signal C_out28: std_logic;
signal C_out29: std_logic;
signal C_out30: std_logic;
signal C_out31: std_logic;

signal saida_s: std_logic;
signal sig_over: std_logic; 

begin




BIT0: entity work.ULA_int     port map(
		SLT => saida_s xor sig_over,
		entradaA => A(0),
		entradaB => B(0),
		inverteB => invB,
		carryIN => invB,
		seletor => sel4x1,
		carryOUT	=> C_out0,
		resultado => resultado(0)
    );
	 
BIT1: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(1),
		entradaB => B(1),
		inverteB => invB,
		carryIN => C_out0,
		seletor => sel4x1,
		carryOUT	=> C_out1,
		resultado => resultado(1)
    );
	 
BIT2: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(2),
		entradaB => B(2),
		inverteB => invB,
		carryIN => C_out1,
		seletor => sel4x1,
		carryOUT	=> C_out2,
		resultado => resultado(2)
    );
	 
BIT3: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(3),
		entradaB => B(3),
		inverteB => invB,
		carryIN => C_out2,
		seletor => sel4x1,
		carryOUT	=> C_out3,
		resultado => resultado(3)
    );
	 
BIT4: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(4),
		entradaB => B(4),
		inverteB => invB,
		carryIN => C_out3,
		seletor => sel4x1,
		carryOUT	=> C_out4,
		resultado => resultado(4)
    );

BIT5: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(5),
		entradaB => B(5),
		inverteB => invB,
		carryIN => C_out4,
		seletor => sel4x1,
		carryOUT	=> C_out5,
		resultado => resultado(5)
    );
	 
BIT6: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(6),
		entradaB => B(6),
		inverteB => invB,
		carryIN => C_out5,
		seletor => sel4x1,
		carryOUT	=> C_out6,
		resultado => resultado(6)
    );
	 
BIT7: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(7),
		entradaB => B(7),
		inverteB => invB,
		carryIN => C_out6,
		seletor => sel4x1,
		carryOUT	=> C_out7,
		resultado => resultado(7)
    );
	 
BIT8: entity work.ULA_int     port map(
		SLT => '0',
		entradaA => A(8),
		entradaB => B(8),
		inverteB => invB,
		carryIN => C_out7,
		seletor => sel4x1,
		carryOUT	=> C_out8,
		resultado => resultado(8)
    );

BIT9: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(9),
        entradaB => B(9),
        inverteB => invB,
        carryIN => C_out8,
        seletor => sel4x1,
        carryOUT    => C_out9,
        resultado => resultado(9)
    );

BIT10: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(10),
        entradaB => B(10),
        inverteB => invB,
        carryIN => C_out9,
        seletor => sel4x1,
        carryOUT    => C_out10,
        resultado => resultado(10)
    );

BIT11: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(11),
        entradaB => B(11),
        inverteB => invB,
        carryIN => C_out10,
        seletor => sel4x1,
        carryOUT    => C_out11,
        resultado => resultado(11)
    );

BIT12: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(12),
        entradaB => B(12),
        inverteB => invB,
        carryIN => C_out11,
        seletor => sel4x1,
        carryOUT    => C_out12,
        resultado => resultado(12)
    );

BIT13: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(13),
        entradaB => B(13),
        inverteB => invB,
        carryIN => C_out12,
        seletor => sel4x1,
        carryOUT    => C_out13,
        resultado => resultado(13)
    );

BIT14: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(14),
        entradaB => B(14),
        inverteB => invB,
        carryIN => C_out13,
        seletor => sel4x1,
        carryOUT    => C_out14,
        resultado => resultado(14)
    );

BIT15: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(15),
        entradaB => B(15),
        inverteB => invB,
        carryIN => C_out14,
        seletor => sel4x1,
        carryOUT    => C_out15,
        resultado => resultado(15)
    );

BIT16: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(16),
        entradaB => B(16),
        inverteB => invB,
        carryIN => C_out15,
        seletor => sel4x1,
        carryOUT    => C_out16,
        resultado => resultado(16)
    );

BIT17: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(17),
        entradaB => B(17),
        inverteB => invB,
        carryIN => C_out16,
        seletor => sel4x1,
        carryOUT    => C_out17,
        resultado => resultado(17)
    );

BIT18: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(18),
        entradaB => B(18),
        inverteB => invB,
        carryIN => C_out17,
        seletor => sel4x1,
        carryOUT    => C_out18,
        resultado => resultado(18)
    );

BIT19: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(19),
        entradaB => B(19),
        inverteB => invB,
        carryIN => C_out18,
        seletor => sel4x1,
        carryOUT    => C_out19,
        resultado => resultado(19)
    );

BIT20: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(20),
        entradaB => B(20),
        inverteB => invB,
        carryIN => C_out19,
        seletor => sel4x1,
        carryOUT    => C_out20,
        resultado => resultado(20)
    );

BIT21: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(21),
        entradaB => B(21),
        inverteB => invB,
        carryIN => C_out20,
        seletor => sel4x1,
        carryOUT    => C_out21,
        resultado => resultado(21)
    );

BIT22: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(22),
        entradaB => B(22),
        inverteB => invB,
        carryIN => C_out21,
        seletor => sel4x1,
        carryOUT    => C_out22,
        resultado => resultado(22)
    );

BIT23: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(23),
        entradaB => B(23),
        inverteB => invB,
        carryIN => C_out22,
        seletor => sel4x1,
        carryOUT    => C_out23,
        resultado => resultado(23)
    );

BIT24: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(24),
        entradaB => B(24),
        inverteB => invB,
        carryIN => C_out23,
        seletor => sel4x1,
        carryOUT    => C_out24,
        resultado => resultado(24)
    );

BIT25: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(25),
        entradaB => B(25),
        inverteB => invB,
        carryIN => C_out24,
        seletor => sel4x1,
        carryOUT    => C_out25,
        resultado => resultado(25)
    );

BIT26: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(26),
        entradaB => B(26),
        inverteB => invB,
        carryIN => C_out25,
        seletor => sel4x1,
        carryOUT    => C_out26,
        resultado => resultado(26)
    );  

BIT27: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(27),
        entradaB => B(27),
        inverteB => invB,
        carryIN => C_out26,
        seletor => sel4x1,
        carryOUT    => C_out27,
        resultado => resultado(27)
    );  

BIT28: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(28),
        entradaB => B(28),
        inverteB => invB,
        carryIN => C_out27,
        seletor => sel4x1,
        carryOUT    => C_out28,
        resultado => resultado(28)
    );

BIT29: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(29),
        entradaB => B(29),
        inverteB => invB,
        carryIN => C_out28,
        seletor => sel4x1,
        carryOUT    => C_out29,
        resultado => resultado(29)
    );  

BIT30: entity work.ULA_int     port map(
        SLT => '0',
        entradaA => A(30),
        entradaB => B(30),
        inverteB => invB,
        carryIN => C_out29,
        seletor => sel4x1,
        carryOUT    => C_out30,
        resultado => resultado(30)
    );
	 
BIT31: entity work.ULA_int_32   port map(
        SLT => '0',
        entradaA => A(31),
        entradaB => B(31),
        inverteB => invB,
        carryIN => C_out30,
        seletor => sel4x1,
        carryOUT    => C_out31,
        resultado => resultado(31),
		  OverFlow => sig_over,
		  saida_soma => saida_s
    );
	 
Z <= '1' when not (resultado(31) or resultado(30) or resultado(29) or resultado(28) or resultado(27) or resultado(26) or resultado(25) or resultado(24) or resultado(23) or resultado(22) or resultado(21) or resultado(20) or resultado(19) or resultado(18) or resultado(17) or resultado(16) or resultado(15) or resultado(14) or resultado(13) or resultado(12) or resultado(11) or resultado(10) or resultado (9) or resultado(8) or resultado(7) or resultado(6) or resultado(5) or resultado(4) or resultado(3) or resultado(2) or resultado(1) or resultado(0)) 
					else '0';
					
end architecture;