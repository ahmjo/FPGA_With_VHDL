library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_cpu is
    port (
        instr   : in std_logic_vector(1 downto 0);
        alu_op  : out std_logic_vector(1 downto 0);
        alu_src : out std_logic;
        reg_dst : out std_logic;
        wr_en   : out std_logic  
    );
end entity;

architecture behavior of control_cpu is
begin
    process(instr)
    begin
        if instr = "00" then
            alu_op <= "00";  -- AND
            alu_src <= '0';
            reg_dst <= '0';
        elsif instr = "01" then
            alu_op <= "01";  -- ADD
            alu_src <= '0';
            reg_dst <= '0';
        elsif instr = "10" then
            alu_op <= "10";  -- SUB
            alu_src <= '0';
            reg_dst <= '0';
        else
            alu_op <= "11";  -- ADDI
            alu_src <= '1';
            reg_dst <= '1';
        end if;
    end process;

    wr_en <= '1';
    
end architecture;