library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MP_Multi is
    port (
        Operand1 : in  std_logic_vector(3 downto 0);
        Operand2 : in  std_logic_vector(3 downto 0); 
        Result   : out std_logic_vector(7 downto 0)   
    );
end MP_Multi;

architecture Behavioral of MP_Multi is
    signal a : unsigned(7 downto 0);
    signal b : unsigned(3 downto 0);
    signal temp_result : unsigned(7 downto 0);
begin
    a <= resize(unsigned(Operand1), 8);
    b <= unsigned(Operand2);
    
    temp_result <= 
        (shift_left(a, 0) and (7 downto 0 => b(0))) +
        (shift_left(a, 1) and (7 downto 0 => b(1))) +
        (shift_left(a, 2) and (7 downto 0 => b(2))) +
        (shift_left(a, 3) and (7 downto 0 => b(3)));
    
    Result <= std_logic_vector(temp_result);
end architecture;