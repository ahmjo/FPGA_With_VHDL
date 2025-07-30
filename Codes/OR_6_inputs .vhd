library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_6_inputs is
    Port (
        A, B, C, D, E, F : in  STD_LOGIC;
        Y                : out STD_LOGIC
    );
end OR_6_inputs;

architecture Behavioral of OR_6_inputs is
begin
    Y <= A or B or C or D or E or F;
end Behavioral;

