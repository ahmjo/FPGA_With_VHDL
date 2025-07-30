library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mealy_AND_OR_FSM_tb is
end Mealy_AND_OR_FSM_tb;

architecture behavior of Mealy_AND_OR_FSM_tb is

    component Mealy_AND_OR_FSM
        Port (
            clk  : in  std_logic;
            rst  : in  std_logic;
            A    : in  std_logic;
            B    : in  std_logic;
            Z    : out std_logic
        );
    end component;

    signal clk  : std_logic := '0';
    signal rst  : std_logic := '1';
    signal A    : std_logic := '0';
    signal B    : std_logic := '0';
    signal Z    : std_logic;

    constant clk_period : time := 10 ns;

begin

    uut: Mealy_AND_OR_FSM
        port map (
            clk => clk,
            rst => rst,
            A   => A,
            B   => B,
            Z   => Z
        );

    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    stim_proc: process
    begin
        wait for 20 ns;
        rst <= '0';

        A <= '0'; B <= '0'; wait for clk_period;
        A <= '1';         wait for 2*clk_period;
        A <= '0';         wait for clk_period;
        A <= '1';         wait for clk_period;

        A <= '0'; B <= '1'; wait for clk_period;
        A <= '1';         wait for clk_period;

        A <= '0'; B <= '0'; wait for clk_period;
        A <= '1';         wait for clk_period;

        A <= '1'; B <= '1'; wait for clk_period;
        A <= '0';         wait for clk_period;
        A <= '1';         wait for clk_period;

        wait for 50 ns;
    end process;

end behavior;
