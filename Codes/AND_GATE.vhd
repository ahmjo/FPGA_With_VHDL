library IEEE;
use ieee.std_logic_1164.all;

entity AND_GATE is
    port (
        A, B : in std_logic;
        Z    : out std_logic
    );
end entity AND_GATE;

architecture Gate of AND_GATE is
begin
    Z <= A and B;
end architecture Gate;

