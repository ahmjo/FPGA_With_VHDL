library IEEE;
use ieee.std_logic_1164.all;

entity Full_Adder_4bit is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Cin  : in std_logic;
        Sum  : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end entity Full_Adder_4bit;

architecture FA4 of Full_Adder_4bit is

    component Full_Adder
        port (
            X, Y, Cin : in std_logic;
            Cout, sum : out std_logic
        );
    end component;

    signal C : std_logic_vector(3 downto 0);
begin

    FA0: Full_Adder port map (
        X => A(0),
        Y => B(0),
        Cin => Cin,
        sum => Sum(0),
        Cout => C(0)
    );

    FA1: Full_Adder port map (
        X => A(1),
        Y => B(1),
        Cin => C(0),
        sum => Sum(1),
        Cout => C(1)
    );

    FA2: Full_Adder port map (
        X => A(2),
        Y => B(2),
        Cin => C(1),
        sum => Sum(2),
        Cout => C(2)
    );

    FA3: Full_Adder port map (
        X => A(3),
        Y => B(3),
        Cin => C(2),
        sum => Sum(3),
        Cout => C(3)
    );

    Cout <= C(3);
end architecture FA4;
