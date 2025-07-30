library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mealy_AND_OR_FSM is
    Port (
        clk  : in  std_logic;
        rst  : in  std_logic;
        A    : in  std_logic;
        B    : in  std_logic;
        Z    : out std_logic
    );
end Mealy_AND_OR_FSM;

architecture Behavioral of Mealy_AND_OR_FSM is

    type state_type is (S_AND, S_OR);
    signal state    : state_type := S_AND;
    signal A_prev   : std_logic := '0';

begin

    process(clk, rst)
    begin
        if rst = '1' then
            state   <= S_AND;
            A_prev  <= '0';
            Z       <= '0';

        elsif rising_edge(clk) then
            case state is
                when S_AND =>
                    Z <= A and A_prev;
                    if B = '1' then
                        state <= S_OR;
                    end if;

                when S_OR =>
                    Z <= A or A_prev;
                    if B = '1' then
                        state <= S_AND;
                    end if;

            end case;

            A_prev <= A;

        end if;
    end process;

end Behavioral;
