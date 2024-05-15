library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULA is
    port(
		invB		   : in 	std_logic;
		A 	         : in	std_logic_vector(31 downto 0);
		B 	         : in 	std_logic_vector(31 downto 0);
		seletor		: in 	std_logic_vector(1 downto 0);
		resultado   : out std_logic_vector(31 downto 0);
		Z           : out std_logic
    );
end entity;

architecture comportamento of ULA is

signal CO_0, CO_1, CO_2, CO_3, CO_4, CO_5, CO_6, CO_7: std_logic;
signal CO_8, CO_9, CO_10, CO_11, CO_12, CO_13, CO_14, CO_15: std_logic;
signal CO_16, CO_17, CO_18, CO_19, CO_20, CO_21, CO_22, CO_23: std_logic;
signal CO_24, CO_25, CO_26, CO_27, CO_28, CO_29, CO_30, CO_31: std_logic;

signal saida_s: std_logic;
signal sig_over: std_logic; 

begin

BIT0: entity work.ULA_bit     port map(
		SLT => saida_s xor sig_over,
		entradaA => A(0),
		entradaB => B(0),
		invB => invB,
		carryIN => invB,
		seletor => seletor,
		carryOUT	=> CO_0,
		resultado => resultado(0)
    );
	 
BIT1: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(1),
		entradaB => B(1),
		invB => invB,
		carryIN => CO_0,
		seletor => seletor,
		carryOUT	=> CO_1,
		resultado => resultado(1)
    );
	 
BIT2: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(2),
		entradaB => B(2),
		invB => invB,
		carryIN => CO_1,
		seletor => seletor,
		carryOUT	=> CO_2,
		resultado => resultado(2)
    );
	 
BIT3: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(3),
		entradaB => B(3),
		invB => invB,
		carryIN => CO_2,
		seletor => seletor,
		carryOUT	=> CO_3,
		resultado => resultado(3)
    );
	 
BIT4: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(4),
		entradaB => B(4),
		invB => invB,
		carryIN => CO_3,
		seletor => seletor,
		carryOUT	=> CO_4,
		resultado => resultado(4)
    );

BIT5: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(5),
		entradaB => B(5),
		invB => invB,
		carryIN => CO_4,
		seletor => seletor,
		carryOUT	=> CO_5,
		resultado => resultado(5)
    );
	 
BIT6: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(6),
		entradaB => B(6),
		invB => invB,
		carryIN => CO_5,
		seletor => seletor,
		carryOUT	=> CO_6,
		resultado => resultado(6)
    );
	 
BIT7: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(7),
		entradaB => B(7),
		invB => invB,
		carryIN => CO_6,
		seletor => seletor,
		carryOUT	=> CO_7,
		resultado => resultado(7)
    );
	 
BIT8: entity work.ULA_bit     port map(
		SLT => '0',
		entradaA => A(8),
		entradaB => B(8),
		invB => invB,
		carryIN => CO_7,
		seletor => seletor,
		carryOUT	=> CO_8,
		resultado => resultado(8)
    );

BIT9: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(9),
        entradaB => B(9),
        invB => invB,
        carryIN => CO_8,
        seletor => seletor,
        carryOUT    => CO_9,
        resultado => resultado(9)
    );

BIT10: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(10),
        entradaB => B(10),
        invB => invB,
        carryIN => CO_9,
        seletor => seletor,
        carryOUT    => CO_10,
        resultado => resultado(10)
    );

BIT11: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(11),
        entradaB => B(11),
        invB => invB,
        carryIN => CO_10,
        seletor => seletor,
        carryOUT    => CO_11,
        resultado => resultado(11)
    );

BIT12: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(12),
        entradaB => B(12),
        invB => invB,
        carryIN => CO_11,
        seletor => seletor,
        carryOUT    => CO_12,
        resultado => resultado(12)
    );

BIT13: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(13),
        entradaB => B(13),
        invB => invB,
        carryIN => CO_12,
        seletor => seletor,
        carryOUT    => CO_13,
        resultado => resultado(13)
    );

BIT14: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(14),
        entradaB => B(14),
        invB => invB,
        carryIN => CO_13,
        seletor => seletor,
        carryOUT    => CO_14,
        resultado => resultado(14)
    );

BIT15: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(15),
        entradaB => B(15),
        invB => invB,
        carryIN => CO_14,
        seletor => seletor,
        carryOUT    => CO_15,
        resultado => resultado(15)
    );

BIT16: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(16),
        entradaB => B(16),
        invB => invB,
        carryIN => CO_15,
        seletor => seletor,
        carryOUT    => CO_16,
        resultado => resultado(16)
    );

BIT17: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(17),
        entradaB => B(17),
        invB => invB,
        carryIN => CO_16,
        seletor => seletor,
        carryOUT    => CO_17,
        resultado => resultado(17)
    );

BIT18: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(18),
        entradaB => B(18),
        invB => invB,
        carryIN => CO_17,
        seletor => seletor,
        carryOUT    => CO_18,
        resultado => resultado(18)
    );

BIT19: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(19),
        entradaB => B(19),
        invB => invB,
        carryIN => CO_18,
        seletor => seletor,
        carryOUT    => CO_19,
        resultado => resultado(19)
    );

BIT20: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(20),
        entradaB => B(20),
        invB => invB,
        carryIN => CO_19,
        seletor => seletor,
        carryOUT    => CO_20,
        resultado => resultado(20)
    );

BIT21: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(21),
        entradaB => B(21),
        invB => invB,
        carryIN => CO_20,
        seletor => seletor,
        carryOUT    => CO_21,
        resultado => resultado(21)
    );

BIT22: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(22),
        entradaB => B(22),
        invB => invB,
        carryIN => CO_21,
        seletor => seletor,
        carryOUT    => CO_22,
        resultado => resultado(22)
    );

BIT23: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(23),
        entradaB => B(23),
        invB => invB,
        carryIN => CO_22,
        seletor => seletor,
        carryOUT    => CO_23,
        resultado => resultado(23)
    );

BIT24: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(24),
        entradaB => B(24),
        invB => invB,
        carryIN => CO_23,
        seletor => seletor,
        carryOUT    => CO_24,
        resultado => resultado(24)
    );

BIT25: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(25),
        entradaB => B(25),
        invB => invB,
        carryIN => CO_24,
        seletor => seletor,
        carryOUT    => CO_25,
        resultado => resultado(25)
    );

BIT26: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(26),
        entradaB => B(26),
        invB => invB,
        carryIN => CO_25,
        seletor => seletor,
        carryOUT    => CO_26,
        resultado => resultado(26)
    );  

BIT27: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(27),
        entradaB => B(27),
        invB => invB,
        carryIN => CO_26,
        seletor => seletor,
        carryOUT    => CO_27,
        resultado => resultado(27)
    );  

BIT28: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(28),
        entradaB => B(28),
        invB => invB,
        carryIN => CO_27,
        seletor => seletor,
        carryOUT    => CO_28,
        resultado => resultado(28)
    );

BIT29: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(29),
        entradaB => B(29),
        invB => invB,
        carryIN => CO_28,
        seletor => seletor,
        carryOUT    => CO_29,
        resultado => resultado(29)
    );  

BIT30: entity work.ULA_bit     port map(
        SLT => '0',
        entradaA => A(30),
        entradaB => B(30),
        invB => invB,
        carryIN => CO_29,
        seletor => seletor,
        carryOUT    => CO_30,
        resultado => resultado(30)
    );
	 
BIT31: entity work.ULA_bit_32   port map(
        SLT => '0',
        entradaA => A(31),
        entradaB => B(31),
        invB => invB,
        carryIN => CO_30,
        seletor => seletor,
        carryOUT    => CO_31,
        resultado => resultado(31),
		  OverFlow => sig_over,
		  saida_soma => saida_s
    );
	 
Z <= '1' when not (resultado(31) or resultado(30) or resultado(29) or resultado(28) or resultado(27) or resultado(26) or 
						resultado(25) or resultado(24) or resultado(23) or resultado(22) or resultado(21) or resultado(20) or resultado(19) or 
						resultado(18) or resultado(17) or resultado(16) or resultado(15) or resultado(14) or resultado(13) or resultado(12) or 
						resultado(11) or resultado(10) or resultado (9) or resultado(8) or resultado(7) or resultado(6) or resultado(5) or 
						resultado(4) or resultado(3) or resultado(2) or resultado(1) or resultado(0)) 
			else '0';
					
end architecture;