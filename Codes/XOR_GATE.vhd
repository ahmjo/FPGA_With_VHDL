library IEEE;
use ieee.std_logic_1164.all;

entity XOR_GATE is
    port (
        A, B : in std_logic;
        Z    : out std_logic
    );
end entity XOR_GATE;

architecture Gate2 of XOR_GATE is
begin
    Z <= A xor B;
end architecture Gate2;