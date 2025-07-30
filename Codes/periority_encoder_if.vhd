library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity Priority_Encoder_if is
    port (
        D : in  std_logic_vector(3 downto 0);
        Y : out std_logic_vector(1 downto 0);
        V : out std_logic
    );
end entity;

architecture Behavioral of Priority_Encoder_if is
begin

    process(D)
    begin
        if D = "0000" then
            Y <= "00";
            V <= '0';
        elsif D(3) = '1' then
            Y <= "11";
            V <= '1';
        elsif D(2) = '1' then
            Y <= "10";
            V <= '1';
        elsif D(1) = '1' then
            Y <= "01";
            V <= '1';
        else
            Y <= "00";
            V <= '1';
        end if;
    end process;

end architecture;
