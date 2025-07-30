library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Fun_3 is
    port (
        X   : in std_logic_vector (1 downto 0);
        Y   : in std_logic_vector (1 downto 0);
        Z : out std_logic_vector (3 downto 0) 
    );
end entity;

architecture Behavioral of Fun_3 is

component Decoder_4to16 is
    port (
        A      : in std_logic_vector(3 downto 0);
        enable : in std_logic;
        Y      : out std_logic_vector(15 downto 0)
    );
end component;

component Multiplexer_2to1 is
    Port (
        A, B    : in  STD_LOGIC;
        SEL     : in  STD_LOGIC;
        Y       : out STD_LOGIC
    );
end component;

component OR_6_inputs is
    Port (
        A, B, C, D, E, F : in  STD_LOGIC;
        Y                : out STD_LOGIC
    );
end component;

signal not_X , xor_X  : std_logic;
signal decoder_output : std_logic_vector (15 downto 0);
signal decoder_input  : std_logic_vector (3 downto 0);

begin
    not_X <= not X(0);
	xor_X <= X(1) xor X(0);	
	decoder_input <= Y(1) & Y(0) & X(1) & X(0);

	DECODER_INST: Decoder_4to16 port map (
        A      => decoder_input,
        enable => '1',
        Y      => decoder_output
        );
	
	Z(3) <= Y(1) and Y(0);

    or_Z2 : OR_6_inputs port map (
        A => decoder_output(7),
        B => decoder_output(8),
        C => decoder_output(9),
        D => decoder_output(10),
        E => decoder_output(11),
        F => decoder_output(15),
        Y => Z(2)
    );

    MUX_Z0 : Multiplexer_2to1 port map (
        A => X(0),
        B => not_X,
        SEL => Y(0),
        Y => Z(0)
    );

    MUX_Z1 : Multiplexer_2to1 port map (
        A => X(1),
        B => xor_X,
        SEL => Y(0),
        Y => Z(1)
    );

end architecture;
