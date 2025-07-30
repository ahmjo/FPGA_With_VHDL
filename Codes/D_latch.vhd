library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity D_latch is
    port (
        c : in std_logic;
        d : in std_logic;
        q : out std_logic
    );
end entity D_latch;


architecture Behavioral of D_latch is

begin
    process(c, d)
    begin
        if c = '1' then
            q <= d;
        end if;
    end process;

end architecture Behavioral;