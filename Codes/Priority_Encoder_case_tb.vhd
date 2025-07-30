library IEEE;
use ieee.std_logic_1164.all;

entity Priority_Encoder_case_tb is
end Priority_Encoder_case_tb;

architecture behavior of Priority_Encoder_case_tb is

    signal D : std_logic_vector(3 downto 0);
    signal Y : std_logic_vector(1 downto 0);
    signal V : std_logic;

begin

    uut: entity work.Priority_Encoder_case
        port map (
            D => D,
            Y => Y,
            V => V
        );

    stim_proc: process
    begin
        D <= "0000"; wait for 10 ns;
        D <= "0001"; wait for 10 ns;
        D <= "0010"; wait for 10 ns;
        D <= "0011"; wait for 10 ns;
        D <= "0100"; wait for 10 ns;
        D <= "0101"; wait for 10 ns;
        D <= "0110"; wait for 10 ns;
        D <= "0111"; wait for 10 ns;
        D <= "1000"; wait for 10 ns;
        D <= "1001"; wait for 10 ns;
        D <= "1010"; wait for 10 ns;
        D <= "1011"; wait for 10 ns;
        D <= "1100"; wait for 10 ns;
        D <= "1101"; wait for 10 ns;
        D <= "1110"; wait for 10 ns;
        D <= "1111"; wait for 10 ns;
        wait;
    end process;

end behavior;

