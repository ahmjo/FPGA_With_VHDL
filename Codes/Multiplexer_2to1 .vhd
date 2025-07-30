library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_2to1 is
    Port (
        A, B    : in  STD_LOGIC;
        SEL     : in  STD_LOGIC;
        Y       : out STD_LOGIC
    );
end Multiplexer_2to1;

architecture Behavioral of Multiplexer_2to1 is
begin
    Y <= A when SEL = '0' else B;
end Behavioral;

