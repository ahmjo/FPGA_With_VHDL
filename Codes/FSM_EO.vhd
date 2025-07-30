library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_EO is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        input   : in  STD_LOGIC;
        output  : out STD_LOGIC
    );
end entity;

architecture Behavioral of FSM_EO is
    type state_type is (A, B, C, D);
    signal current_state, next_state : state_type;

begin

    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= A;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, input)
    begin
        case current_state is
            when A =>
                if input = '0' then
                    next_state <= B;
                else
                    next_state <= D;
                end if;

            when B =>
                if input = '0' then
                    next_state <= A;
                else
                    next_state <= C;
                end if;

            when C =>
                if input = '0' then
                    next_state <= D;
                else
                    next_state <= B;
                end if;

            when D =>
                if input = '0' then
                    next_state <= C;
                else
                    next_state <= A;
                end if;

            when others =>
                next_state <= A;
        end case;
    end process;

    output <= '1' when current_state = B else '0';

end architecture;