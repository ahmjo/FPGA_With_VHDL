library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Multiplier_4x4_ShiftAdd is
end tb_Multiplier_4x4_ShiftAdd;

architecture Behavioral of tb_Multiplier_4x4_ShiftAdd is
    signal op1 : std_logic_vector(3 downto 0) := x"0";
    signal op2 : std_logic_vector(3 downto 0) := x"0";
    signal res : std_logic_vector(7 downto 0);
    
    component Multiplier_4x4_ShiftAdd
        port(
            Operand1 : in  std_logic_vector(3 downto 0);
            Operand2 : in  std_logic_vector(3 downto 0);
            Result   : out std_logic_vector(7 downto 0)
        );
    end component;
    
begin
    uut: Multiplier_4x4_ShiftAdd port map(op1, op2, res);
    
    process
    begin
        op1 <= x"3"; op2 <= x"2"; wait for 10 ns; -- 3 * 2 = 6
        op1 <= x"7"; op2 <= x"3"; wait for 10 ns; -- 7 * 3 = 21
        op1 <= x"2"; op2 <= x"5"; wait for 10 ns; -- 2 * 5 = 10
        op1 <= x"F"; op2 <= x"F"; wait for 10 ns; -- 15 * 15 = 225
        wait;
    end process;
end Behavioral;