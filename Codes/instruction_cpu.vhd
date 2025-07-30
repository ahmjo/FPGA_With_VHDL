library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instraction_cpu is
      port(
            instr_adder : in std_logic_vector(2 downto 0);
            op          : out std_logic_vector(1 downto 0);
            rs          : out std_logic_vector(1 downto 0);
            rt          : out std_logic_vector(1 downto 0);
            rd          : out std_logic_vector(1 downto 0) 
      );
end entity;

architecture behavior of instraction_cpu is
      type instraction_set is array (0 to 7) of std_logic_vector(7 downto 0); 
      constant instr : instraction_set := (
            "01000010",  -- Instr 0: op=01(ADD), rs=00, rt=00
            "11010101",  -- Instr 1: op=11(ADDI), rs=01, rt=01
            "11101011",  -- Instr 2: op=11(ADDI), rs=10, rt=10
            "01000111",  -- Instr 3: op=01(ADD), rs=00, rt=00
            "10101100",  -- Instr 4: op=10(SUB), rs=10, rt=11
            "00000110",  -- Instr 5: op=00(AND), rs=01, rt=10
            "00100000",  -- Instr 6: op=00(AND), rs=10, rt=00
            "00000000"   -- Instr 7: op=00(AND), rs=00, rt=00
      );
begin 
      op <= instr(to_integer(unsigned(instr_adder)))(7 downto 6);
      rs <= instr(to_integer(unsigned(instr_adder)))(5 downto 4);
      rt <= instr(to_integer(unsigned(instr_adder)))(3 downto 2);
      rd <= instr(to_integer(unsigned(instr_adder)))(1 downto 0);
end architecture;