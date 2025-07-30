library IEEE;
use IEEE.std_logic_1164.all;

entity tb_counter_type_ADC is
end entity;

architecture Behavioral of tb_counter_type_ADC is

    signal clk      : std_logic := '0';
    signal reset    : std_logic := '1';
    signal Vi       : std_logic_vector(3 downto 0) := (others => '0');
    signal adc_out  : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    uut: entity work.counter_type_ADC
        port map (
            clk     => clk,
            reset   => reset,
            Vi      => Vi,
            adc_out => adc_out
        );

    clk_process : process
    begin
        while now < 500 us loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    stimulus_process : process
    begin
        reset <= '1';
        wait for 25 ns;
        reset <= '0';

        Vi <= "0001"; wait for 100 us;
        Vi <= "0010"; wait for 100 us;
        Vi <= "0100"; wait for 100 us;
        Vi <= "1000"; wait for 100 us;

        wait;
    end process;

end architecture Behavioral;
