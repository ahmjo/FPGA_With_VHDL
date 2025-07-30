library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MP_b_greater_a is
      port(
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            z :out std_logic_vector(7 downto 0)
      );
end MP_b_greater_a;

architecture Behavioral of MP_b_greater_a is

begin
      process(a,b)
      begin 
            if unsigned(a) < unsigned (b) then
                  z <= "00000001";
            else   
                  z <= "00000000";
            end if;
      end process ;

end Behavioral; 