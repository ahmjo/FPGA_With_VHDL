library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DAC is
    port (
        binary_input : in  std_logic_vector(3 downto 0);
        V_out        : out std_logic_vector(3 downto 0)
    );
end entity;

architecture Behavioral of DAC is
    type voltage_map is array (0 to 15) of std_logic_vector(3 downto 0);
    constant VREF_VALUES : voltage_map := (
        0 => "0000",
        1 => "0001",
        2 => "0010",
        3 => "0011",
        4 => "0100",
        5 => "0101",
        6 => "0110",
        7 => "0111",
        8 => "1000",
        9 => "1001",
        10 => "1010",
        11 => "1011",
        12 => "1100",
        13 => "1101",
        14 => "1110",
        15 => "1111"
    );

    signal index : integer := 0;

begin
    index <= to_integer(unsigned(binary_input));

    V_out <= VREF_VALUES(index) when index >= 0 and index <= 15 else "0000";

end architecture;