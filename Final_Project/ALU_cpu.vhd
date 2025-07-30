library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_cpu is 
    port(
        op        : in std_logic_vector(1 downto 0);
        rs        : in std_logic_vector(7 downto 0);
        rt        : in std_logic_vector(7 downto 0);
        rd        : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of ALU_cpu is
    signal result : std_logic_vector(7 downto 0);
begin
    process(op, rs, rt)
    begin
        case op is
            when "00" =>  
                result <= rs and rt; 
            when "01" => 
                result <= std_logic_vector(unsigned(rs) + unsigned(rt));  
            when "10" =>  
                result <= std_logic_vector(unsigned(rs) - unsigned(rt));  
            when "11" =>  
                result <= std_logic_vector(unsigned(rs) + unsigned(rt)); 
            when others =>
                result <= (others => '0'); 
        end case;
    end process;

    rd <= result;
end architecture;