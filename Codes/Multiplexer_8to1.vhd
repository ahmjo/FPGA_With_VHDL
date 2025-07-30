library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_8to1 is
    port(
        selector : in  std_logic_vector(2 downto 0);
        inputs   : in  std_logic_vector(7 downto 0);
        y        : out std_logic
    );
end entity;

architecture Behavioral of Multiplexer_8to1 is
begin
    with selector select
        y <= inputs(0) when "000",
                inputs(1) when "001",
                inputs(2) when "010",
                inputs(3) when "011",
                inputs(4) when "100",
                inputs(5) when "101",
                inputs(6) when "110",
                inputs(7) when others;
end architecture;