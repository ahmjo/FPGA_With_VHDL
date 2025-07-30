library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;  -- Needed for real arithmetic

entity counter_adc_real is
    Port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        start    : in  std_logic;
        vin      : in  real;  -- Analog input as real number (e.g., 0.0 to 5.0 V)
        digital_out : out unsigned(7 downto 0);
        done     : out std_logic
    );
end counter_adc_real;

architecture Behavioral of counter_adc_real is

    constant VREF       : real := 5.0;  -- Reference voltage of ADC
    constant RES_BITS   : integer := 8; -- 8-bit ADC
    constant MAX_COUNT  : integer := 2**RES_BITS - 1;

    signal counter      : unsigned(7 downto 0) := (others => '0');
    signal dac_voltage  : real := 0.0;
    signal running      : std_logic := '0';

begin

    -- DAC process: convert digital counter value to analog voltage (real)
    dac_proc : process(counter)
    begin
        dac_voltage <= (real(to_integer(counter)) / real(MAX_COUNT)) * VREF;
    end process;

    -- Main ADC process
    adc_proc : process(clk, reset)
    begin
        if reset = '1' then
            counter      <= (others => '0');
            digital_out  <= (others => '0');
            done         <= '0';
            running      <= '0';
            dac_voltage  <= 0.0;

        elsif rising_edge(clk) then
            if start = '1' then
                running <= '1';
                done    <= '0';
            end if;

            if running = '1' then
                if dac_voltage < vin and to_integer(counter) < MAX_COUNT then
                    counter <= counter + 1;
                else
                    digital_out <= counter;
                    done        <= '1';
                    running     <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
