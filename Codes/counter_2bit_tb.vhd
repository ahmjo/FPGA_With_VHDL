library IEEE;
use IEEE.std_logic_1164.all;

entity counter_2bit_tb is
end entity;

architecture Behavioral of counter_2bit_tb is

    component counter_2bit
        port (
            clk   : in  std_logic;
            reset : in  std_logic;
            q     : out std_logic_vector(1 downto 0)
        );
    end component;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal q     : std_logic_vector(1 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut: counter_2bit port map (
        clk   => clk,
        reset => reset,
        q     => q
    );

    clk_gen: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    stim: process
    begin

        wait for 10 ns;

        reset <= '1';
        wait for 15 ns;
        reset <= '0';

        wait for 60 ns;

        wait;

    end process;

end architecture;
