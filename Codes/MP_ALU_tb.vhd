library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MP_ALU_tb is
end MP_ALU_tb;

architecture Behavioral of MP_ALU_tb is

    signal op1, op2 : std_logic_vector(3 downto 0);
    signal opcode   : std_logic_vector(2 downto 0);
    signal result   : std_logic_vector(7 downto 0);

    component MP_ALU_4bit
        port (
            operand1 : in std_logic_vector(3 downto 0);
            operand2 : in std_logic_vector(3 downto 0);
            opcode   : in std_logic_vector(2 downto 0);
            Result   : out std_logic_vector(7 downto 0)
        );
    end component;

begin

    uut: component MP_ALU_4bit
        port map (
            operand1 => op1,
            operand2 => op2,
            opcode   => opcode,
            Result   => result
        );

    stim_proc: process
    begin

        -- Test 1: Addition
        op1 <= "0011";     -- 3
        op2 <= "0101";     -- 5
        opcode <= "000";   -- ADD
        -- Expected result = 8 => "00001000"
        wait for 10 ns;

        -- Test 2: Subtraction
        op1 <= "0111";     -- 7
        op2 <= "0011";     -- 3
        opcode <= "001";   -- SUB
        -- Expected result = 4 => "00000100"
        wait for 10 ns;

        -- Test 3: Multiplication
        op1 <= "0010";     -- 2
        op2 <= "0101";     -- 5
        opcode <= "010";   -- MUL
        -- Expected result = 10 => "00001010"
        wait for 10 ns;

        -- Test 4: Greater Than
        op1 <= "0110";     -- 6
        op2 <= "0100";     -- 4
        opcode <= "011";   -- GT
        -- Expected result = 1 => "00000001"
        wait for 10 ns;

        -- Test 5: Less Than
        op1 <= "0010";     -- 2
        op2 <= "0111";     -- 7
        opcode <= "100";   -- LT
        -- Expected result = 1 => "00000001"
        wait for 10 ns;

        -- Test 6: No Operation
        opcode <= "101";   -- NOP
        -- Expected result = 0 => "00000000"
        wait for 10 ns;

        -- Test 7: No Operation
        opcode <= "110";   -- NOP
        -- Expected result = 0 => "00000000"
        wait for 10 ns;

        -- Test 8: No Operation
        opcode <= "111";   -- NOP
        -- Expected result = 0 => "00000000"
        wait for 10 ns;

        wait;

    end process;

end Behavioral;