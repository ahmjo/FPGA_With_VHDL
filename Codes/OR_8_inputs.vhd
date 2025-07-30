library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_8_inputs is
    Port (
        a : in std_logic_vector(7 downto 0);
        y : out std_logic
    );
end OR_8_inputs;

architecture Behavioral of OR_8_inputs is
begin
    y <= a(0) or a(1) or a(2) or a(3) or a(4) or a(5) or a(6) or a(7);
end Behavioral;
