library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_4to1 is
    Port (
        selector : in  STD_LOGIC_VECTOR (1 downto 0);
	a,b,c,d  : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end Multiplexer_4to1;

architecture Behavioral of Multiplexer_4to1 is

begin
	Y <=	a when (selector = "00") else
		b when (selector = "01") else
		c when (selector = "10") else
		d;

end Behavioral;

