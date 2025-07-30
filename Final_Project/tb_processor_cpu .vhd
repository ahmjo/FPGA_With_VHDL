library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_processor_cpu is
end entity;

architecture behavioral of tb_processor_cpu is
    signal clk   : std_logic := '0';
    signal value : std_logic_vector(7 downto 0);
    
begin
    -- Clock generation
    clk <= not clk after 10 ns;
    
    -- Unit under test
    uut: entity work.processor_cpu
        port map (
            clk   => clk,
            value => value
        );
    
    -- Test process
    test_process: process
    begin
        wait for 400 ns;
        wait;
    end process;

end architecture;