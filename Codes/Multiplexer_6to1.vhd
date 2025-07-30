library IEEE;
use ieee.std_logic_1164.all;

entity Multiplexer_6to1 is
     port(
          selector       : in std_logic_vector(2 downto 0);
          a,b,c,d,e,f    : in std_logic_vector(7 downto 0);
          y              : out std_logic_vector(7 downto 0)
     );
end Multiplexer_6to1 ;

architecture Behavioral of Multiplexer_6to1 is
begin
     y <= a when (selector ="000")else
          b when (selector ="001")else
          c when (selector ="010")else
          d when (selector ="011")else
          e when (selector ="100")else
          f when (selector ="101")else
          f when (selector ="110")else
          f when (selector ="111")else
          "00000000";

end Behavioral ;  