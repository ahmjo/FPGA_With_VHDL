library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Z_X_Y_Q_int is
    Port (
        X : in  STD_LOGIC_VECTOR (1 downto 0);
        Y : in STD_LOGIC;
        Z : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Z_X_Y_Q_int;

architecture Behavioral of Z_X_Y_Q_int is

    component Decoder_3to8 is
        Port (
            A : in  STD_LOGIC_VECTOR (2 downto 0);
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    component OR_4_inputs is
        Port (
            A, B, C, D : in  STD_LOGIC;
            Y          : out STD_LOGIC
        );
    end component;

    component AND_3_inputs is
        Port (
            A, B, C : in  STD_LOGIC;
            Y       : out STD_LOGIC
        );
    end component;

    component BCD_to_7seg_CA_int is
        Port (
            BCD  : in  std_logic_vector(3 downto 0);
            int_out : out integer range 0 to 9
        );
    end component;

    signal decoder_input : STD_LOGIC_VECTOR(2 downto 0);
    signal decoder_output : STD_LOGIC_VECTOR(7 downto 0);
    signal Z_internal : STD_LOGIC_VECTOR(3 downto 0);
    signal int_value : integer range 0 to 9;

begin

    decoder_input <= X(0) & X(1) & Y;

    DECODER: Decoder_3to8 port map (
        A => decoder_input,
        Y => decoder_output
    );

    OR_Z0: OR_4_inputs port map (
        A => decoder_output(1),
        B => decoder_output(3),
        C => decoder_output(4),
        D => decoder_output(6),
        Y => Z_internal(0)
    );

    OR_Z1: OR_4_inputs port map (
        A => decoder_output(2),
        B => decoder_output(3),
        C => decoder_output(5),
        D => decoder_output(6),
        Y => Z_internal(1)
    );

    AND_Z2: AND_3_inputs port map (
        A => X(0),
        B => X(1),
        C => Y,
        Y => Z_internal(2)
    );

    Z_internal(3) <= '0';

    Z <= Z_internal;

    BCD_CONV: BCD_to_7seg_CA_int port map (
        BCD => Z_internal,
        int_out => int_value
    );

end Behavioral;

