library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_bus_top is
    port (
        src_select : in  STD_LOGIC_VECTOR(1 downto 0);  
        data_in_0  : in  STD_LOGIC_VECTOR(7 downto 0);  
        data_in_1  : in  STD_LOGIC_VECTOR(7 downto 0);  
        data_in_2  : in  STD_LOGIC_VECTOR(7 downto 0);  
        data_in_3  : in  STD_LOGIC_VECTOR(7 downto 0);  
        data_bus   : out STD_LOGIC_VECTOR(7 downto 0)   
    );
end entity;

architecture Behavioral of tri_state_bus_top is

    component Decoder_2to4
        port (
            A      : in std_logic_vector (1 downto 0);
            enable : in std_logic;
            Y      : out std_logic_vector (3 downto 0)
        );
    end component;

    component Tri_State_Bus
        port (
            data_in  : in  STD_LOGIC_VECTOR(7 downto 0);
            enable   : in  STD_LOGIC;
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal enables : STD_LOGIC_VECTOR(3 downto 0);
    signal bus_0, bus_1, bus_2, bus_3 : STD_LOGIC_VECTOR(7 downto 0);

begin

    dec_inst: Decoder_2to4
        port map (
            A      => src_select,
            enable => '1',  
            Y      => enables
        );

    tbuf0: Tri_State_Bus
        port map (
            data_in  => data_in_0,
            enable   => enables(0),
            data_out => bus_0
        );

    tbuf1: Tri_State_Bus
        port map (
            data_in  => data_in_1,
            enable   => enables(1),
            data_out => bus_1
        );

    tbuf2: Tri_State_Bus
        port map (
            data_in  => data_in_2,
            enable   => enables(2),
            data_out => bus_2
        );

    tbuf3: Tri_State_Bus
        port map (
            data_in  => data_in_3,
            enable   => enables(3),
            data_out => bus_3
        );

    with enables select
        data_bus <= 
            bus_0 when "0001",
            bus_1 when "0010",
            bus_2 when "0100",
            bus_3 when "1000",
            (others => 'Z') when others;

end architecture;