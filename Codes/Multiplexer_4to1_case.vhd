library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_4to1 is
    Port (
        selector : in  STD_LOGIC_VECTOR (1 downto 0);
        a, b, c, d : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end Multiplexer_4to1;

architecture Behavioral of Multiplexer_4to1 is
begin

    process(selector, a, b, c, d)
    begin
        case selector is
            when "00" =>
                Y <= a;
            when "01" =>
                Y <= b;
            when "10" =>
                Y <= c;
            when others =>
                Y <= d;
        end case;
    end process;

end Behavioral;

