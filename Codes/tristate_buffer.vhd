library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tristate_buffer is
    Port (
        ena	 : in  STD_LOGIC;
	inp 	 : in  STD_LOGIC_VECTOR (7 downto 0);
        out1	 : out STD_LOGIC_VECTOR (7 downto 0)
    );
end tristate_buffer;

architecture Behavioral of tristate_buffer is

begin
	out1 <=	inp when(ena ='1') else
		(others => 'Z');

end Behavioral;

