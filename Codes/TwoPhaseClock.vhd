library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoPhaseClock is
    Port (
        X       : in STD_LOGIC;
        clk     : in STD_LOGIC;
        reset   : in STD_LOGIC;
        P1      : out STD_LOGIC;
        P2      : out STD_LOGIC
    );
end TwoPhaseClock;

architecture Behavioral of TwoPhaseClock is
    type StateType is (A, B, C, D);
    signal currentState, nextState : StateType;
begin
    process (currentState, X)
    begin
        case currentState is
            when A =>
                if X = '1' then
                    nextState <= B;
                else
                    nextState <= A;
                end if;
            when B =>
                if X = '1' then
                    nextState <= C;
                else
                    nextState <= B;
                end if;
            when C =>
                if X = '1' then
                    nextState <= D;
                else
                    nextState <= C;
                end if;
            when D =>
                if X = '1' then
                    nextState <= A;
                else
                    nextState <= D;
                end if;
            when others =>
                nextState <= A;
        end case;
    end process;

    process (clk, reset)
    begin
        if reset = '1' then
            currentState <= A;
        elsif rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process;

    process (currentState)
    begin
        case currentState is
            when A =>
                P1 <= '0';
                P2 <= '0';
            when B =>
                P1 <= '1';
                P2 <= '1';
            when C =>
                P1 <= '1';
                P2 <= '0';
            when D =>
                P1 <= '1';
                P2 <= '1';
            when others =>
                P1 <= '0';
                P2 <= '0';
        end case;
    end process;

end Behavioral;