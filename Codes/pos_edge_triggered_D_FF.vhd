library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pos_edge_triggered_D_FF is
    port (
        clk : in std_logic;
        d : in std_logic;
        q : out std_logic
    );
end entity pos_edge_triggered_D_FF;

architecture Behavioral of pos_edge_triggered_D_FF is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            q <= d;
        end if;
    end process;

end architecture Behavioral;