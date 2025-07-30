library IEEE;
use ieee.std_logic_1164.all;

entity Decoder_2to4_tb is
end Decoder_2to4_tb;

architecture Behavioral of Decoder_2to4_tb is

    component Decoder_2to4 is
        port (
            A      : in std_logic_vector (1 downto 0);
            enable : in std_logic;
            Y      : out std_logic_vector (3 downto 0)
        );
    end component;

    signal A      : std_logic_vector (1 downto 0) := (others => '0');
    signal enable : std_logic := '0';
    signal Y      : std_logic_vector (3 downto 0);

begin

    dut: Decoder_2to4
        port map (
            A      => A,
            enable => enable,
            Y      => Y
        );

    stim_proc : process
    begin
        enable <= '0';
        A <= "00";
        wait for 10 ns;

        enable <= '1';
        A <= "00";
        wait for 10 ns;

        A <= "01";
        wait for 10 ns;

        A <= "10";
        wait for 10 ns;

        A <= "11";
        wait for 10 ns;

        enable <= '0';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;

