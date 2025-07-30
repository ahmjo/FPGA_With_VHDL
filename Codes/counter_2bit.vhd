library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_2bit is
    port (
        clk   : in  std_logic;
        reset : in  std_logic;
        q     : out std_logic_vector(1 downto 0)
    );
end entity counter_2bit;

architecture Behavioral of counter_2bit is
    signal count : std_logic_vector(1 downto 0) := "00";
begin

    process(clk, reset)
    begin
        if reset = '1' then
            count <= "00";
        elsif rising_edge(clk) then
            if count = "11" then
                count <= "00"; 
            else
                count <= std_logic_vector(unsigned(count) + 1);
            end if;
        end if;
    end process;

    q <= count; 

end architecture Behavioral;

