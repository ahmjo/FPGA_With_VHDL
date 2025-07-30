library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_4to1_case_tb is
end Multiplexer_4to1_case_tb;

architecture behavior of Multiplexer_4to1_case_tb is

    signal selector : std_logic_vector(1 downto 0);
    signal a, b, c, d : std_logic;
    signal Y : std_logic;

begin

    uut: entity work.Multiplexer_4to1
        port map (
            selector => selector,
            a => a,
            b => b,
            c => c,
            d => d,
            Y => Y
        );

    stim_proc: process
    begin
        a <= '1'; b <= '0'; c <= '0'; d <= '0';
        selector <= "00";
        wait for 10 ns;

        a <= '0'; b <= '1'; c <= '0'; d <= '0';
        selector <= "01";
        wait for 10 ns;

        a <= '0'; b <= '0'; c <= '1'; d <= '0';
        selector <= "10";
        wait for 10 ns;

        a <= '0'; b <= '0'; c <= '0'; d <= '1';
        selector <= "11";
        wait for 10 ns;

        d <= '0';
        selector <= "11";
        wait for 10 ns;

        wait;
    end process;

end behavior;

