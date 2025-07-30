library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc_cpu is 
  port (
      clk : in std_logic ;
      next_state :out std_logic_vector(2 downto 0)
      );
end entity ;

architecture behavior of pc_cpu is 
  signal current_state :std_logic_vector(2 downto 0):="000";
begin
  process ( clk ) 
  begin 
      if falling_edge (clk) then 
        current_state <= std_logic_vector(unsigned(current_state)+ 001);
      end if;
  end process;

  next_state <= current_state; 

end architecture ;