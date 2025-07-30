library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX0_cpu is
    port (
        a   : in std_logic_vector(1 downto 0);
        b   : in std_logic_vector(1 downto 0);
        sel : in std_logic;
        y   : out std_logic_vector(1 downto 0)
    );
end entity;

architecture behavioral of MUX0_cpu is
begin
    process (a, b, sel)
    begin
        if sel = '1' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end architecture;