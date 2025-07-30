library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_4bit is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        q     : out std_logic_vector(3 downto 0)
    );
end entity counter_4bit;

architecture Behavioral of counter_4bit is
    signal count : std_logic_vector(3 downto 0) := "0000";
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count <= "0000";
        elsif rising_edge(clk) then
            count <= std_logic_vector(unsigned(count) + 1);
        end if;
    end process;

    q <= count; 

end architecture Behavioral;

