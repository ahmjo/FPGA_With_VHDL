library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MP_Sub is
    Port (
        Operand1 : in  std_logic_vector(3 downto 0);
        Operand2 : in  std_logic_vector(3 downto 0);
        Result   : out std_logic_vector(7 downto 0)
    );
end MP_Sub;

architecture Behavioral of MP_Sub is
    signal op1_ext  : unsigned(7 downto 0);
    signal op2_comp : unsigned(7 downto 0);
begin
    op1_ext  <= resize(unsigned(Operand1), 8);
    op2_comp <= not resize(unsigned(Operand2), 8) + 1;

    Result <= std_logic_vector(op1_ext + op2_comp);

end Behavioral;