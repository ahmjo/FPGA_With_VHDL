library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity registers_cpu is 
    port (
        clk      : in std_logic;
        wr_en    : in std_logic;  
        rs_addr  : in std_logic_vector(1 downto 0);
        rd_addr  : in std_logic_vector(1 downto 0);
        rt_addr  : in std_logic_vector(1 downto 0);
        wr_data  : in std_logic_vector(7 downto 0);
        rs       : out std_logic_vector(7 downto 0);
        rt       : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of registers_cpu is 
    type registers_set is array (0 to 3) of std_logic_vector(7 downto 0);
    signal regis : registers_set := (
        "01000010",  -- 66
        "11010101",  -- 213
        "11101011",  -- 235
        "01000111"   -- 71
    );
begin 
    process(clk)
    begin 
        if falling_edge(clk) then
            if wr_en = '1' then
                regis(to_integer(unsigned(rd_addr))) <= wr_data;
            end if;
        end if;
    end process;

    rs <= regis(to_integer(unsigned(rs_addr)));
    rt <= regis(to_integer(unsigned(rt_addr)));
end architecture;