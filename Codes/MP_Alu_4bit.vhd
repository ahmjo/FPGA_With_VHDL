library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MP_ALU_4bit is
        port( 
            operand1    :in std_logic_vector(3 downto 0);
            operand2    :in std_logic_vector(3 downto 0);
            opcode :in std_logic_vector(2 downto 0);
            Result      :out std_logic_vector(7 downto 0)
        );
end MP_ALU_4bit;

architecture Behavioral of MP_ALU_4bit is

component MP_Adder is
    Port (
        Operand1 : in std_logic_vector(3 downto 0);
        Operand2 : in std_logic_vector(3 downto 0);
        Result   : out std_logic_vector(7 downto 0)
    );
end component;

component MP_Sub is
    Port (
        Operand1 : in  std_logic_vector(3 downto 0);
        Operand2 : in  std_logic_vector(3 downto 0);
        Result   : out std_logic_vector(7 downto 0)
    );
end component;

component MP_Multi is
    port (
        Operand1 : in  std_logic_vector(3 downto 0);
        Operand2 : in  std_logic_vector(3 downto 0); 
        Result   : out std_logic_vector(7 downto 0)   
    );
end component;


component MP_a_greater_b is
    port(
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        z :out std_logic_vector(7 downto 0)
    );
end component;

component MP_b_greater_a is
    port(
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        z :out std_logic_vector(7 downto 0)
    );
end component;

component Multiplexer_6to1 is
    port(
        selector : in std_logic_vector(2 downto 0);
        a,b,c,d,e,f  : in std_logic_vector(7 downto 0);
        y: out std_logic_vector(7 downto 0)
    );
end component;


signal adder_result   : std_logic_vector(7 downto 0);
signal sub_result     : std_logic_vector(7 downto 0);
signal multip_result  : std_logic_vector(7 downto 0);
signal result1, result2 : std_logic_vector(7 downto 0);

begin

adder : MP_Adder port map (
    Operand1 => operand1,
    Operand2 => operand2,
    Result   => adder_result
);

sub : MP_Sub port map (
    Operand1 => operand1,
    Operand2 => operand2,
    Result   => sub_result
);

multiply : MP_Multi port map ( 
    Operand1 => operand1,
    Operand2 => operand2,
    Result   => multip_result
);

agreaterb : MP_a_greater_b port map (
    a => operand1,
    b => operand2,
    z => result1
);

bgratera : MP_b_greater_a port map (
    a => operand1,
    b => operand2,
    z => result2
);

mux : Multiplexer_6to1 port map (
    selector => opcode, 
    a => adder_result,
    b => sub_result,
    c => multip_result,
    d => result1,
    e => result2,
    f => (others => '0'),
    y => Result
);

end Behavioral;