library IEEE;
use ieee.std_logic_1164.all;

entity even_parity_detector2 is
    port(
        a    : in std_logic_vector(2 downto 0);
        even : out std_logic
    );
end entity even_parity_detector2;

architecture behavioral of even_parity_detector2 is

    component XOR_GATE is
        port (
            A, B : in std_logic;
            Z    : out std_logic
        );
    end component;

    component NOT_GATE is
        port (
            A : in std_logic;
            Z : out std_logic
        );
    end component;

    signal sig1, sig2 : std_logic;

begin

    xor_1 : XOR_GATE port map (A => a(0), B => a(1), Z => sig1);
    xor_2 : XOR_GATE port map (A => sig1, B => a(2), Z => sig2);

    not_1 : NOT_GATE port map (A => sig2, Z => even);

end architecture behavioral;
