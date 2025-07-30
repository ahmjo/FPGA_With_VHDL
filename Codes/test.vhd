library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity test is
    port (
        D : in  std_logic_vector(3 downto 0);
        Y : out std_logic_vector(1 downto 0);
        V : out std_logic
    );
end entity;

architecture Behavioral of test is
begin

    process(D)
    begin
        V <= '1';
        case? D is
            when "0000" =>
                Y <= "00";
                V <= '0';
            when "1---" =>
                Y <= "11";
            when "01--" =>
                Y <= "10";
            when "001-" =>
                Y <= "01";
            when others =>
                Y <= "00";
        end case?;
    end process;

end architecture;

