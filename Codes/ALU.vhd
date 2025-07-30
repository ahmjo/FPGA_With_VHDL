library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A   : in  std_logic_vector(7 downto 0);
        B   : in  std_logic_vector(7 downto 0);
        C   : in  std_logic_vector(2 downto 0);
        Result : out std_logic_vector(7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, C)
    begin
        case C is
            when "100" =>
                Result <= std_logic_vector(unsigned(A) + unsigned(B)); 
            when "101" =>
                Result <= std_logic_vector(unsigned(A) - unsigned(B)); 
            when "110" =>
                Result <= A and B;
            when "111" =>
                Result <= A or B; 
            when others =>
                Result <= std_logic_vector(unsigned(A) + 1);
        end case;
    end process;
end Behavioral;
