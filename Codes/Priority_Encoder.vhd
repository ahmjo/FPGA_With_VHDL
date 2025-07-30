library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity Priority_Encoder is
    port (
        D : in  std_logic_vector(3 downto 0);
        Y : out std_logic_vector(1 downto 0);
        V : out std_logic
    );
end entity;

architecture Behavioral of Priority_Encoder is
begin
    Y <= "11" when std_match(D, "1---") else
         "10" when std_match(D, "01--") else
         "01" when std_match(D, "001-") else
         "00";
    
    V <= '1' when D /= "0000" else '0';
end architecture;
