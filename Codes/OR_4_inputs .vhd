library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_4_inputs is
    Port (
        A, B, C, D : in  STD_LOGIC;
        Y          : out STD_LOGIC 
    );
end OR_4_inputs;

architecture Behavioral of OR_4_inputs is
begin
    Y <= A or B or C or D;
end Behavioral;
