library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_EO_tb is
end entity;

architecture Behavioral of FSM_EO_tb is
    component FSM_EO
        Port (
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            input   : in  STD_LOGIC;
            output  : out STD_LOGIC
        );
    end component;

    signal clk, reset, input, output : STD_LOGIC;
    constant clk_period : time := 10 ns;

begin
    uut: FSM_EO port map (
        clk     => clk,
        reset   => reset,
        input   => input,
        output  => output
    );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    stim_proc: process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';

        input <= '1';
        wait for clk_period;

        input <= '0';
        wait for clk_period;

        input <= '1';
        wait for clk_period;

        input <= '0';
        wait for clk_period;

        input <= '1';
        wait for clk_period;

        input <= '0';
        wait for clk_period;

        wait;
    end process;
end architecture;
