library IEEE;
use ieee.std_logic_1164.all;

entity Full_Adder is
    port (
        X, Y, Cin : in std_logic;
        Cout, sum : out std_logic
    );
end entity Full_Adder;

architecture FA of Full_Adder is
begin
    sum  <= X xor Y xor Cin after 10 ps;
    Cout <= (X and Cin) or (X and Y) or (Y and Cin) after 10 ps;
end architecture FA;