library ieee;
use ieee.std_logic_1164.all;

entity LUI is
    port
    (
        -- Input ports
        LUI_IN : in  std_logic_vector(15 downto 0);
        -- Output ports
        LUI_OUT: out std_logic_vector(31 downto 0)
    );
end entity;

architecture comportamento of LUI is
begin

    LUI_OUT <= LUI_IN & "0000000000000000";

end architecture;