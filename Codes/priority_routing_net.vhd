library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity priority_routing_net is
    port (
        a,b : in  std_logic_vector(3 downto 0);
        x,y : in  std_logic_vector(1 downto 0);
        f   : out std_logic_vector(7 downto 0) 
    );
end entity priority_routing_net;

architecture Behavioral of priority_routing_net is

    signal Wave1, Wave2, Wave3 : std_logic_vector(7 downto 0); 
    signal condition1 : unsigned(1 downto 0);

begin

    Wave1 <= std_logic_vector(resize(unsigned(a), 8) + resize(unsigned(b), 8));
    Wave2 <= std_logic_vector(resize(unsigned(a), 8) - resize(unsigned(b), 8) - 1);
    Wave3 <= std_logic_vector(resize(unsigned(a), 8) - 1);
    
    condition1 <= unsigned(x) + unsigned(y);
    
    f <= Wave1 when condition1 > 1 else
         Wave2 when ((unsigned(x) > unsigned(y)) and (unsigned(y) > 0)) else
         Wave3;

end architecture Behavioral;
