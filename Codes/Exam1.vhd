library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Exam1 is
port (
    X     : in  std_logic_vector(1 downto 0);
    Y     : in  std_logic_vector(1 downto 0);
    Z     : out std_logic_vector(1 downto 0); 
    signZ : out std_logic
);
end entity;

architecture Behavioral of Exam1 is

    component Decoder_4to16 is
        port (
            A      : in std_logic_vector(3 downto 0);
            enable : in std_logic;
            Y      : out std_logic_vector(15 downto 0)
        );
    end component;

    component Multiplexer_8to1 is
        port(
            selector : in std_logic_vector(2 downto 0);
            inputs   : in std_logic_vector(7 downto 0);
            y        : out std_logic
        );
    end component;

    component OR_8_inputs is
        Port (
            a : in std_logic_vector(7 downto 0);
            y : out std_logic
        );
    end component;

    signal select_input : std_logic_vector(3 downto 0);
    signal decoder_out  : std_logic_vector(15 downto 0);
    signal mux_inputs   : std_logic_vector(7 downto 0);
    signal not_Y0      : std_logic;

begin

    select_input <= X & Y;

    DEC: Decoder_4to16 port map (
        A => select_input,
        enable => '1',
        Y => decoder_out
    );

    OR_Z0: OR_8_inputs port map (
        a(0) => decoder_out(1),  
        a(1) => decoder_out(3),
        a(2) => decoder_out(4),  
        a(3) => decoder_out(6),  
        a(4) => decoder_out(9),  
        a(5) => decoder_out(11), 
        a(6) => decoder_out(12), 
        a(7) => decoder_out(14), 
        y    => Z(0)
    );

    not_Y0 <= not Y(0);

    MUX_Z1: Multiplexer_8to1 port map (
        selector => select_input(3 downto 1),
        inputs(0) => '0',
        inputs(1) => '1',
        inputs(2) => '0',
        inputs(3) => Y(0),
        inputs(4) => not_Y0,
        inputs(5) => '0',
        inputs(6) => '1',
        inputs(7) => '0',
        y        => Z(1)
    );

    signZ <= (not x(1) and y(1)) or
            (not x(1) and not x(0) and y(0)) or
            (not x(0) and y(1) and y(0)) or
            (x(1) and not x(0) and y(1) and not y(0));
end architecture Behavioral;