library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tri_State_Bus is
    port (
        data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
        enable   : in  STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture Behavioral of Tri_State_Bus is
begin
    process(enable, data_in)
    begin
        if enable = '1' then
            data_out <= data_in;
        else
            data_out <= (others => 'Z');
        end if;
    end process;
end architecture;
