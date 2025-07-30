library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_type_ADC is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        Vi       : in  std_logic_vector(3 downto 0);
        adc_out  : out std_logic_vector(3 downto 0)
    );
end entity;

architecture Structural of counter_type_ADC is

    signal count        : std_logic_vector(3 downto 0);
    signal Vref_digital : std_logic_vector(3 downto 0);
    signal comp_out     : std_logic;
    signal and_out      : std_logic;

    component counter_4bit
        port (
            clk   : in  std_logic;
            reset : in  std_logic;
            q     : out std_logic_vector(3 downto 0)
        );
    end component;

    component DAC
        port (
            binary_input : in  std_logic_vector(3 downto 0);
            V_out        : out std_logic_vector(3 downto 0)
        );
    end component;

    component comparator
        port (
            Vi       : in  std_logic_vector(3 downto 0);
            Vref     : in  std_logic_vector(3 downto 0);
            comp_out : out std_logic
        );
    end component;

    component AND_GATE
        port (
            A, B : in std_logic;
            Z    : out std_logic
        );
    end component;

begin

    CNT: counter_4bit
        port map (
            clk   => and_out,
            reset => reset,
            q     => count
        );

    DAC_INST: DAC
        port map (
            binary_input => count,
            V_out        => Vref_digital
        );

    COMP: comparator
        port map (
            Vi       => Vi,
            Vref     => Vref_digital,
            comp_out => comp_out
        );

    AND1: AND_GATE
        port map (
            A => clk,
            B => comp_out,
            Z => and_out
        );

    adc_out <= count;

end architecture Structural;
