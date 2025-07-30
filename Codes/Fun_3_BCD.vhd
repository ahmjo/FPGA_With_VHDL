library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Fun_3_BCD is
    port (
        X   : in std_logic_vector (1 downto 0);
        Y   : in std_logic_vector (1 downto 0);
        Int_low  : out integer range 0 to 9;
        Int_high : out integer range 0 to 9
    );
end entity;

architecture Behavioral of Fun_3_BCD is

component BCD_to_7seg_CA_int is
    Port (
        BCD  : in  std_logic_vector(3 downto 0);
        int_out : out integer range 0 to 9
    );
end component;

component Fun_3 is
    port (
        X   : in std_logic_vector (1 downto 0);
        Y   : in std_logic_vector (1 downto 0);
        Z : out std_logic_vector (3 downto 0) 
    );
end component;

signal Z           : std_logic_vector(3 downto 0);
signal seg_temp    : std_logic_vector(7 downto 0);
signal seg_l       : std_logic_vector(3 downto 0);
signal seg_h       : std_logic_vector(3 downto 0);

begin

    FUN_3_INST: Fun_3 port map (
        X => X,
        Y => Y,
        Z => Z
    );

    process(Z)
    begin
        if unsigned(Z) <= 9 then
            seg_temp <= "0000" & Z;
        else
            seg_temp <= std_logic_vector(unsigned("0000" & Z) + 6);  
        end if;
    end process;

    seg_l <= seg_temp(3 downto 0);
    seg_h <= seg_temp(7 downto 4);

    seg_l_INST : BCD_to_7seg_CA_int port map (
        BCD      => seg_l,
        int_out  => Int_low
    );

    seg_h_INST : BCD_to_7seg_CA_int port map (
        BCD      => seg_h,
        int_out  => Int_high
    );

end architecture;
