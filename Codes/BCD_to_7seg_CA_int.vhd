library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_to_7seg_CA_int is
    Port (
        BCD  : in  std_logic_vector(3 downto 0);
        int_out : out integer range 0 to 9
    );
end BCD_to_7seg_CA_int;

architecture Behavioral of BCD_to_7seg_CA_int is
begin
    process(BCD)
    begin
        case BCD is
            when "0000" => int_out <= 0;
            when "0001" => int_out <= 1;
            when "0010" => int_out <= 2;
            when "0011" => int_out <= 3;
            when "0100" => int_out <= 4;
            when "0101" => int_out <= 5;
            when "0110" => int_out <= 6;
            when "0111" => int_out <= 7;
            when "1000" => int_out <= 8;
            when "1001" => int_out <= 9;
            when others => int_out <= 0;
        end case;
    end process;
end Behavioral;

