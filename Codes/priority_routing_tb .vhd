library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity priority_routing_tb is
end priority_routing_tb;

architecture test of priority_routing_tb is

    signal a, b : std_logic_vector(3 downto 0);
    signal x, y : std_logic_vector(1 downto 0);
    signal f    : std_logic_vector(7 downto 0);

begin

    uut: entity work.priority_routing_net
        port map (
            a => a,
            b => b,
            x => x,
            y => y,
            f => f
        );

    stimulus: process
    begin
        for ai in 0 to 15 loop
            for bi in 0 to 15 loop
                for xi in 0 to 3 loop
                    for yi in 0 to 3 loop
                        a <= std_logic_vector(to_unsigned(ai, 4));
                        b <= std_logic_vector(to_unsigned(bi, 4));
                        x <= std_logic_vector(to_unsigned(xi, 2));
                        y <= std_logic_vector(to_unsigned(yi, 2));
                        wait for 10 ns;
                    end loop;
                end loop;
            end loop;
        end loop;

        wait; 
    end process;

end architecture test;
