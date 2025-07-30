library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoPhaseClock_tb is
end TwoPhaseClock_tb;

architecture Behavioral of TwoPhaseClock_tb is
    component TwoPhaseClock
        Port (
            X : in STD_LOGIC;
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            P1 : out STD_LOGIC;
            P2 : out STD_LOGIC
        );
    end component;
    
    signal X, clk, reset, P1, P2 : STD_LOGIC;
    
begin
    uut: TwoPhaseClock port map (
        X => X,
        clk => clk,
        reset => reset,
        P1 => P1,
        P2 => P2
    );
    
    clk_process: process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
    
    stim_proc: process
    begin
        reset <= '1';
        X <= '0';
        
        wait for 20 ns;
        reset <= '0';
        
        wait for 20 ns;
        X <= '1';
        
        wait for 100 ns;
        X <= '0';
        
        wait for 40 ns;
        X <= '1';
        
        wait;
    end process;
end Behavioral;
