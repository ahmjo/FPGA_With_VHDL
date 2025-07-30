library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MP_Adder is
    Port (
        Operand1 : in std_logic_vector(3 downto 0);
        Operand2 : in std_logic_vector(3 downto 0);
        Result   : out std_logic_vector(7 downto 0)
    );
end MP_Adder;

architecture Behavioral of MP_Adder is
begin
    process (Operand1, Operand2)
    begin
        Result <= std_logic_vector(resize(unsigned(Operand1), 8) + resize(unsigned(Operand2), 8));
    end process;
end Behavioral;

