library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparator is
    port (
        Vi       : in  std_logic_vector(3 downto 0); 
        Vref     : in  std_logic_vector(3 downto 0); 
        comp_out : out std_logic                   
    );
end entity comparator;

architecture Behavioral of comparator is
begin
    process(Vi, Vref)
    begin
        if unsigned(Vi) > unsigned(Vref) then
            comp_out <= '1';
        else
            comp_out <= '0';
        end if;
    end process;
end architecture Behavioral;
