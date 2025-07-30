library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX1_cpu is
    port (
        a   : in std_logic_vector(7 downto 0);  
        b   : in std_logic_vector(7 downto 0);  
        sel : in std_logic;                    
        y   : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavioral of MUX1_cpu is
begin
    process (a, b, sel)
    begin
        if sel = '1' then
            y <= b; 
        else
            y <= a; 
        end if;
    end process;
end architecture;