library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_3_inputs is
    Port (
        A, B, C : in  STD_LOGIC;
        Y       : out STD_LOGIC  
    );
end AND_3_inputs;

architecture Behavioral of AND_3_inputs is
begin
    Y <= A and B and C;
end Behavioral;
