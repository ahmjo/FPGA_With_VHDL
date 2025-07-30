library IEEE;
use ieee.std_logic_1164.all;

entity OR_GATE is
    port (
        A, B : in std_logic;
        Z    : out std_logic
    );
end entity OR_GATE;

architecture Gate of OR_GATE is
begin
    Z <= A or B;
end architecture Gate;
