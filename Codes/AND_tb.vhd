library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_tb is
end AND_tb;

architecture Behavioral of AND_tb is

    component AND_GATE is
        port (
            A, B : in std_logic;
            Z    : out std_logic
        );
    end component;

    signal A, B : std_logic := '0';
    signal Z    : std_logic;

begin
    dut: AND_GATE
        port map (
            A => A,
            B => B,
            Z => Z
        );

    stim_proc : process
    begin
        A <= '0'; B <= '0';
        wait for 10 ns;

        A <= '0'; B <= '1';
        wait for 10 ns;

        A <= '1'; B <= '0';
        wait for 10 ns;

        A <= '1'; B <= '1';
        wait for 10 ns;

    end process;

end Behavioral;

