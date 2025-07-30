library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.standard.boolean;
entity Decoder_tb is
end Decoder_tb;

architecture Behavioral of Decoder_tb is

component Decoder is
    port (
        dec_input  : in std_logic_vector (2 downto 0);
        dec_output : out std_logic
    );
end component;

signal dec_input  : std_logic_vector (2 downto 0) := (others => '0');
signal dec_output : std_logic;

begin
    dut: Decoder
        port map (
            dec_input  => dec_input,
            dec_output => dec_output
        );

    stim_proc1 : process
    begin
        for I in 0 to 7 loop
            dec_input <= std_logic_vector(unsigned(dec_input) + 1);
            wait for 10 ns;
        end loop;
        wait;
    end process;

    stim_proc2 : process
        variable error_sig : boolean := false;
    begin
        wait for 10 ns;
        if (dec_output = '1' and dec_input = "101") then
            error_sig := false;
        elsif (dec_output = '1') then
            error_sig := true;
        end if;
        wait;
    end process;

end Behavioral;
