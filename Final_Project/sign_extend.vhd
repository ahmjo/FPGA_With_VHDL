library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign_extend is
    port(
        input_2bit  : in  std_logic_vector(1 downto 0);
        output_8bit : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of sign_extend is
begin
    output_8bit <= "000000" & input_2bit;
end architecture;
