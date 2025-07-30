library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_tri_state_bus_tb is
end entity tb_tri_state_bus_tb;

architecture Behavioral of tb_tri_state_bus_tb is

    component tri_state_bus_top
        port (
            src_select : in  STD_LOGIC_VECTOR(1 downto 0);  
            data_in_0  : in  STD_LOGIC_VECTOR(7 downto 0);  
            data_in_1  : in  STD_LOGIC_VECTOR(7 downto 0);  
            data_in_2  : in  STD_LOGIC_VECTOR(7 downto 0);  
            data_in_3  : in  STD_LOGIC_VECTOR(7 downto 0);  
            data_bus   : out STD_LOGIC_VECTOR(7 downto 0)   
        );
    end component;

    signal src_select : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal data_in_0  : STD_LOGIC_VECTOR(7 downto 0) := "00000000"; 
    signal data_in_1  : STD_LOGIC_VECTOR(7 downto 0) := "10101010"; 
    signal data_in_2  : STD_LOGIC_VECTOR(7 downto 0) := "01010101"; 
    signal data_in_3  : STD_LOGIC_VECTOR(7 downto 0) := "11111111"; 
    signal data_bus   : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: tri_state_bus_top
        port map (
            src_select => src_select,
            data_in_0  => data_in_0,
            data_in_1  => data_in_1,
            data_in_2  => data_in_2,
            data_in_3  => data_in_3,
            data_bus   => data_bus
        );

    process
    begin

        src_select <= "00"; wait for 10 ns;

        src_select <= "01"; wait for 10 ns;

        src_select <= "10"; wait for 10 ns;

        src_select <= "11"; wait for 10 ns;

        wait;

    end process;

end architecture Behavioral;
