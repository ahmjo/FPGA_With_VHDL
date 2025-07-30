library IEEE;
use ieee.std_logic_1164.all;

entity NAND_GATE is
    port (
        A, B : in std_logic;
        Z    : out std_logic
    );
end entity NAND_GATE;

architecture Gate of NAND_GATE is
begin
    Z <= not (A and B);
end architecture Gate;