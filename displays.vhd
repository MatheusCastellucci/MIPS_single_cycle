library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity displays is
	port (
		entrada		: in 	std_logic_vector(23 downto 0);
		apaga 	   : in	std_logic;
		negativo 	: in 	std_logic;
		overFlow		: in 	std_logic;
		saida7seg0  : out std_logic_vector(6 downto 0);
		saida7seg1  : out std_logic_vector(6 downto 0);
		saida7seg2  : out std_logic_vector(6 downto 0);
		saida7seg3  : out std_logic_vector(6 downto 0);
		saida7seg4  : out std_logic_vector(6 downto 0);
		saida7seg5  : out std_logic_vector(6 downto 0)
		);
		
end entity;

architecture comportamento of displays is
	signal dis0: std_logic_vector(6 downto 0);
	signal dis1: std_logic_vector(6 downto 0);
	signal dis2: std_logic_vector(6 downto 0);
	signal dis3: std_logic_vector(6 downto 0);
	signal dis4: std_logic_vector(6 downto 0);
	signal dis5: std_logic_vector(6 downto 0);


begin

display0 :  entity work.conversorHex7Seg
        port map (
                dadoHex => entrada(3 downto 0),
                apaga =>  apaga,
                negativo => negativo,
                overFlow =>  overFlow,
                saida7seg => dis0
                );
					  
display1 :  entity work.conversorHex7Seg
        port map (
                dadoHex => entrada(7 downto 4),
                apaga =>  apaga,
                negativo => negativo,
                overFlow =>  overFlow,
                saida7seg => dis1
                );
				
display2 :  entity work.conversorHex7Seg
        port map (
                dadoHex => entrada(11 downto 8),
                apaga =>  apaga,
                negativo => negativo,
                overFlow =>  overFlow,
                saida7seg => dis2
                );
				
display3 :  entity work.conversorHex7Seg
        port map (
                dadoHex => entrada(15 downto 12),
                apaga =>  apaga,
                negativo => negativo,
                overFlow =>  overFlow,
                saida7seg => dis3
                );
				
display4 :  entity work.conversorHex7Seg
        port map (
                dadoHex => entrada(19 downto 16),
                apaga =>  apaga,
                negativo => negativo,
                overFlow =>  overFlow,
                saida7seg => dis4
                );
				
display5 :  entity work.conversorHex7Seg
        port map (
                dadoHex => entrada(23 downto 20),
                apaga =>  apaga,
                negativo => negativo,
                overFlow =>  overFlow,
                saida7seg => dis5
                );
	 
saida7seg0 <= dis0;
saida7seg1 <= dis1;
saida7seg2 <= dis2;
saida7seg3 <= dis3;
saida7seg4 <= dis4;
saida7seg5 <= dis5;

end architecture;